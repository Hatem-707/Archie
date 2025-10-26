import 'package:archie/auth/auth_service.dart';
import 'package:archie/widgets/big_button.dart';
import 'package:archie/widgets/hero_icon.dart';
import 'package:archie/widgets/input_widget.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  void register(BuildContext context) async {}

  void updatePassword(BuildContext context) async {
    final auth = AuthService();
    final email = _emailController.text;
    final oldPassword = _passwordController.text;
    final newPassword = _newPasswordController.text;
    try {
      await auth.updatePassowrd(context, email, oldPassword, newPassword);
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text("Password changed successfully")),
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Let's change the password",
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
              hintText: "Enter The Old Password",
            ),
            InputWidget(
              controller: _newPasswordController,
              hideInput: true,
              hintText: "Enter The New Password",
            ),
            BigButton(
              tapFun: () {
                updatePassword(context);
              },
              description: "Change Password",
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Changed your mind? "),
                GestureDetector(
                  child: Text(
                    "Return To Settings",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pop(context);
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
