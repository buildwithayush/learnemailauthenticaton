import 'package:fireauthenti/controller/home_controller.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {

    HomeController controller = HomeController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        toolbarHeight: 40,
        centerTitle: true,
        title: const Text(
          'Products Screen',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: controller.products.length ,
        itemBuilder: (context , index){
          final product = controller.products[index];
          return ListTile(
           title: Text(product['Name']),
           subtitle: Text(product['Color']),
           trailing: Text(product['Price'].toString()),
          ); 
          
        },
      ),
    );
  }
}