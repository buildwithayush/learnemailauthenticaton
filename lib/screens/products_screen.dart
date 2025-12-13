import 'package:fireauthenti/controller/home_controller.dart';
import 'package:fireauthenti/models/products_model.dart';
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
      body: FutureBuilder(future: controller.fetchProducts(),
       builder: (context, snapshot){
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }


        return ListView.builder(
          itemCount:snapshot.data!.length, 
          itemBuilder: (context, index){
            final product = snapshot.data![index];
             return ListTile(
                title: Text(product.name),
                subtitle: Text(product.color),
                trailing: Text(product.price.toString()),
             );
          });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.uploadProducts(
            ProductsModel(name: 'Kiwi', color: 'Green', price: 200),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
