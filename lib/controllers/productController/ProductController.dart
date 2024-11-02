import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stock_sync/models/productModel.dart';
import 'package:stock_sync/repository/productRepo.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final ProductRepo productRepo = Get.put(ProductRepo());
  var products = <Product>[].obs;
  var isLoading = true.obs;
  var selectedProduct = Rx<Product?>(null);

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      var fetchedProducts = await productRepo.getAllProducts();
      if (fetchedProducts != null) {
        products.assignAll(fetchedProducts);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> createProduct(Product product) async {
    await productRepo.createProduct(product);
    fetchProducts();
  }

  Future<Product> getProductDetails(String id) async {
    return await productRepo.getProductDetails(id);
  }

  Future<void> updateProduct(Product product) async {
    await productRepo.updateProduct(product);
    fetchProducts();
  }

  Future<void> deleteProduct(String id) async {
    await productRepo.deleteProduct(id);
    fetchProducts();
  }
}