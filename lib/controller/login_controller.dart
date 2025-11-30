import 'package:fireauthenti/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> loginUser(
    String email,
    String password,
    BuildContext context,
  ) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("User Logged In Successfully")),
          );
          debugPrint("User Logged In Successfully");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        })
        .onError((error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("User Failed to Log In : $error")),
          );
          debugPrint("Error ${error.toString()}");
        });
  }
}
