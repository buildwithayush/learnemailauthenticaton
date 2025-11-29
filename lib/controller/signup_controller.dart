import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignupController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> sighUpUser(
    String email,
    String password,
    BuildContext context,
  ) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("User Signed Up Successfully")),
          );
          debugPrint("User Signed Up Successfully");
        })
        .onError((error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("User Failed to Sign Up : $error")),
          );
          debugPrint("Error ${error.toString()}");
        });
  }
}
