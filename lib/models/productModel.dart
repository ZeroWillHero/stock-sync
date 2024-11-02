import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String? id;
  final String name;
  final int stock;
  final double unitPrice;

  Product({
    this.id,
    required this.name,
    required this.stock,
    required this.unitPrice,
  });

  factory Product.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Product(
      id: snapshot.id,
      name: data['name'],
      stock: data['stock'],
      unitPrice: data['unitPrice'],
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      stock: json['stock'],
      unitPrice: json['unitPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'stock': stock,
      'unitPrice': unitPrice,
    };
  }
}