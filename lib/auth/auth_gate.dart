import 'package:feetly/auth/tree_root.dart';
import 'package:feetly/views/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (FirebaseAuth.instance.currentUser!.emailVerified) {
              return const HomePage();
            } else {
              // Show a waiting screen or verification reminder
              return const TreeRoot();
            }
          } else {
            return TreeRoot();
          }
        },
      ),
    );
  }
}
