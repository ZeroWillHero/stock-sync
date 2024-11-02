import 'package:stock_sync/models/productModel.dart';

class Bill {
  final List<Product> products;
  final String shopName;
  final DateTime date;
  final double totalPrice;
  final String status;

  Bill({
    required this.products,
    required this.date,
    required this.totalPrice,
    required this.shopName,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'products': products.map((product) => product.toJson()).toList(),
      'date': date.toIso8601String(),
      'totalPrice': totalPrice,
      'shopName': shopName,
      'status': status,
    };
  }

  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
      products: (json['products'] as List).map((item) => Product.fromJson(item)).toList(),
      date: DateTime.parse(json['date']),
      totalPrice: json['totalPrice'],
      shopName: json['shopName'],
      status: json['status'],
    );
  }
}