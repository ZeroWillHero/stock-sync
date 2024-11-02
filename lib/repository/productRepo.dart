import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:stock_sync/models/productModel.dart';

class ProductRepo extends GetxController {
  static ProductRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createProduct(Product product) async {
    await _db.collection('Products').add(product.toJson());
  }

  Future<Product> getProductDetails(String id) async {
    final snapshot = await _db.collection('Products').doc(id).get();
    return Product.fromSnapshot(snapshot);
  }

  Future<List<Product>> getAllProducts() async {
    final snapshot = await _db.collection('Products').get();
    return snapshot.docs.map((e) => Product.fromSnapshot(e)).toList();
  }

  Future<void> updateProduct(Product product) async {
    await _db.collection('Products').doc(product.id).update(product.toJson());
  }

  Future<void> updateProductStock(String id, int newStock) async {
    await _db.collection('Products').doc(id).update({'stock': newStock});
  }

  Future<void> deleteProduct(String id) async {
    await _db.collection('Products').doc(id).delete();
  }
}