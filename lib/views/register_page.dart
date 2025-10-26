import 'package:archie/auth/auth_service.dart';
import 'package:archie/views/verification_page.dart';
import 'package:archie/widgets/big_button.dart';
import 'package:archie/widgets/hero_icon.dart';
import 'package:archie/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.switchPages});

  final void Function()? switchPages;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void register(BuildContext context) async {
    if (_emailController.text.isNotEmpty &&
        (_passwordController.text == _confirmPasswordController.text)) {
      try {
        final auth = AuthService();
        await auth.createNewUser(
          context,
          _emailController.text,
          _passwordController.text,
        );
        await auth.sendVerificationEmail(context);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text("Invalid credentials")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 160,
              width: 160,
              margin: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(80),
                border: Border.all(
                  width: 4,
                  color: theme.colorScheme.secondary,
                ),
              ),
              padding: EdgeInsets.all(30),
              child: SvgPicture.asset(
                'assets/icons/logo.svg',
                colorFilter: ColorFilter.mode(
                  theme.colorScheme.onPrimary,
                  BlendMode.srcIn,
                ),
                fit: BoxFit.fill,
              ),
            ),
            Text(
              "Archie, Your feet's companion",
              style: theme.textTheme.headlineMedium!.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            Text(
              "Let's make you an account.",
              style: theme.textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary.withAlpha(200),
              ),
            ),
            InputWidget(
              controller: _emailController,
              hideInput: false,
              hintText: "Enter Email Address",
            ),
            InputWidget(
              controller: _passwordController,
              hideInput: true,
              hintText: "Enter a Password",
            ),
            InputWidget(
              controller: _confirmPasswordController,
              hideInput: true,
              hintText: "Enter the Password again",
            ),
            BigButton(
              tapFun: () {
                register(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VerificationPage()),
                );
              },
              description: "register",
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                GestureDetector(
                  child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    widget.switchPages!();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
