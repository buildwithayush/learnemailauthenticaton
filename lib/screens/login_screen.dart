import 'package:fireauthenti/common/common_widget.dart';
import 'package:fireauthenti/controller/login_controller.dart';
import 'package:fireauthenti/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        toolbarHeight: 40,
        centerTitle: true,
        title: const Text(
          'Login Screen',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text(
              "Welcome To This App",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16.0),
            // Email TextFormField
            CommonWidget.buildTextFormField(
              controller: emailController,
              labelText: 'Email',
              prefixIcon: Icons.email,
            ),
            const SizedBox(height: 16.0),
            // Password TextFormField
            CommonWidget.buildTextFormField(
              controller: passwordController,
              labelText: 'Password',
              prefixIcon: Icons.lock,
              suffixIcon: Icons.visibility_off_outlined,
            ),
            const SizedBox(height: 24.0),

            // Login Button
            CommonWidget.buildButton('Login', () async {
              LoginController controller = LoginController();
              await controller.loginUser(
                emailController.text,
                passwordController.text,
                context,
              );
            }),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignupScreen()),
              ),
              child: Text("Don't have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
