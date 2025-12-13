class ProductsModel {
  String name;
  String color;
  double price;

  ProductsModel({required this.name, required this.color, required this.price});

Map<String, dynamic> toMap() {
    return {
      'Name': name ,
      'color': color,
      'price': price,
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      name: map['Name'] ?? '',
      color: map['color'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
    );
  }

}
