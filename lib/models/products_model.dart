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

}
