import 'package:feetly/auth/auth_service.dart';
import 'package:feetly/views/verification_page.dart';
import 'package:feetly/widgets/big_button.dart';
import 'package:feetly/widgets/hero_icon.dart';
import 'package:feetly/widgets/input_widget.dart';
import 'package:flutter/material.dart';

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
            HeroIcon(edge: 100),
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
