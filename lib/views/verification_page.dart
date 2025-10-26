import 'dart:async';
import 'package:archie/auth/auth_gate.dart';
import 'package:archie/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  bool _isVerified = false;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (_) {
      refreshState();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void sendVerificationEmail(BuildContext context) async {
    final auth = AuthService();
    try {
      await auth.sendVerificationEmail(context);
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(title: Text(e.toString())),
      );
    }
  }

  void refreshState() async {
    try {
      final auth = AuthService();
      bool newState = await auth.isUserVerified();
      if (newState) {
        timer.cancel();
      }
      setState(() {
        _isVerified = newState;
      });
    } catch (e) {
      print('Error checking verification: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(title: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (_isVerified) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => AuthGate()),
        (route) => false,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Check Your Email",
          style: theme.textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: SvgPicture.asset(
                    "assets/icons/email.svg",
                    colorFilter: ColorFilter.mode(
                      theme.colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Flexible(
                  child: Text(
                    "A verification Email has been sent please check your inbox!",
                    style: theme.textTheme.displaySmall!.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Didn't revceive an Email? "),
                    GestureDetector(
                      onTap: () {
                        sendVerificationEmail(context);
                      },
                      child: Text(
                        "Resend",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
