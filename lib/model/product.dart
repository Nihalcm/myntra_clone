import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final String brand;
  final int price;
  final int discound;
  final String imageUrl;

  const Product({
    required this.name,
    required this.price,
    required this.brand,
    required this.imageUrl,
    required this.discound,
  });
  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
        name: snap['name'],
        price: snap['price'],
        brand: snap['discount'],
        imageUrl: snap['imageUrl'],
        discound: snap['discount']);
    return product;
  }
}
