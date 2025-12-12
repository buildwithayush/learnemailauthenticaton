import 'package:fireauthenti/common/common_widget.dart';
import 'package:fireauthenti/screens/products_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        toolbarHeight: 40,
        centerTitle: true,
        title: const Text(
          'Home Screen',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 32.0),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CommonWidget.buildButton('Users', () {}),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CommonWidget.buildButton(
              'Products',
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductsScreen()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
