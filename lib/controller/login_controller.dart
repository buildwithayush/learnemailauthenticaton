import 'package:fireauthenti/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to login user using email and password
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
          Navigator.pushReplacement(
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

  // Function to login user using Google Sign-In

  Future<void> googleSignIn(BuildContext context) async {
    // select User Account
    final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

    // verify Auth User
    final GoogleSignInAuthentication? googleAuth =
        await userAccount?.authentication;

    // Get User Credential / personal details
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth!.accessToken,
      idToken: googleAuth.idToken,
    );
    // Firebase login with Google Credential
    await _auth
        .signInWithCredential(credential)
        .then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("User Logged In Successfully with Google")),
          );
          debugPrint("User Logged In Successfully");
          Navigator.pushReplacement(
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
