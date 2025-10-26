import 'package:archie/views/login_page.dart';
import 'package:archie/views/register_page.dart';
import 'package:flutter/material.dart';

class TreeRoot extends StatefulWidget {
  const TreeRoot({super.key});

  @override
  State<TreeRoot> createState() => _TreeRootState();
}

class _TreeRootState extends State<TreeRoot> {
  var logIn = true;

  void toggleLoginRegister() {
    setState(() {
      logIn ^= true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!logIn) {
      return RegisterPage(switchPages: toggleLoginRegister);
    } else {
      return LoginPage(switchPages: toggleLoginRegister);
    }
  }
}
