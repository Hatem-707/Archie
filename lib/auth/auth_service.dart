import 'package:feetly/controllers/loading_mixin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService with LoadingMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in function
  Future<UserCredential> signInWithEmailPassword(
    context,
    String email,
    String password,
  ) async {
    return runWithLoader(context, () async {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        return userCredential;
      } on FirebaseAuthException catch (e) {
        throw Exception(e.code);
      }
    });
  }

  //Sign out

  Future<void> signOut(BuildContext context) async {
    return runWithLoader(context, () async {
      return await _auth.signOut();
    });
  }

  //Create a new user

  Future createNewUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    return runWithLoader(context, () async {
      try {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        throw Exception(e.code);
      }
    });
  }

  // update password (requires the old password)
  Future updatePassowrd(
    BuildContext context,
    String email,
    String oldPassword,
    String newPassword,
  ) async {
    return runWithLoader(context, () async {
      try {
        if (_auth.currentUser != null) {
          AuthCredential credential = EmailAuthProvider.credential(
            email: email,
            password: oldPassword,
          );
          final _user = _auth.currentUser;
          await _user!.reauthenticateWithCredential(credential);
          _user.updatePassword(newPassword);
          return;
        } else {
          throw Exception("No signed in users");
        }
      } on FirebaseAuthException catch (e) {
        throw Exception(e.code);
      }
    });
  }

  Future<void> sendVerificationEmail(BuildContext context) async {
    return runWithLoader(context, () async {
      if (_auth.currentUser != null) {
        try {
          await _auth.currentUser!.reload();
          await _auth.currentUser!.sendEmailVerification();
        } on FirebaseAuthException catch (e) {
          throw Exception(e.code);
        }
      } else {
        throw Exception("Invalid User");
      }
    });
  }

  Future<bool> isUserVerified() async {
    if (_auth.currentUser != null) {
      await _auth.currentUser!.reload();
      if (_auth.currentUser!.emailVerified) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
