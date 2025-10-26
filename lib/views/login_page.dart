import 'package:archie/auth/auth_service.dart';
import 'package:archie/widgets/big_button.dart';
import 'package:archie/widgets/hero_icon.dart';
import 'package:archie/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.switchPages});

  final void Function()? switchPages;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login(BuildContext context) async {
    final authService = AuthService();
    try {
      await authService.signInWithEmailPassword(
        context,
        _emailController.text,
        _passwordController.text,
      );
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text("Login Sucess")),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(e.toString())),
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
              "Welcome back! Please login.",
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
              hintText: "Enter Password",
            ),
            BigButton(
              tapFun: () {
                login(context);
                print("Logged in");
              },
              description: "Login",
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                GestureDetector(
                  child: Text(
                    "Register",
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
