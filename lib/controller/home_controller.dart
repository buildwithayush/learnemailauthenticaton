import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireauthenti/models/products_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final _firestore = FirebaseFirestore.instance;

  Future<void> uploadProducts(ProductsModel product) async {
    await _firestore
        .collection('Products')
        .doc()
        .set(product.toMap())
        .then((value) {
          debugPrint('Product uploaded successfully');
        })
        .catchError((error) {
          debugPrint('Failed to upload product: $error');
        });
  }
}
