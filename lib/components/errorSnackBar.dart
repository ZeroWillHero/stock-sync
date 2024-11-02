import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrSnackBar {
  final String? title;
  final String? message;

  ErrSnackBar({this.title, this.message});

  void showErrorSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      icon: Icon(Icons.error, color: Colors.white),
      duration: Duration(seconds: 3),
    );
  }
}
