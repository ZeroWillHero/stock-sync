import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_sync/controllers/userControllers/getUserController.dart';
import 'package:stock_sync/screens/AddProducts.dart';
import 'package:stock_sync/screens/Users/admin.dart';
import 'package:stock_sync/screens/Users/ref.dart';

import '../models/userModel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  final controller = Get.put(GetUserController());
  String? userRole;

  @override
  void initState() {
    super.initState();
    _getUserRole();
  }

  Future<void> _getUserRole() async {
    try {
      final user = await controller.getUser();
      if (user != null) {
        setState(() {
          userRole = user.role;
        });
      }
    } catch (e) {
      print('Error getting user role: $e');
    }

  }
  @override
  Widget build(BuildContext context) {
    return userRole == 'ref' ? Ref() : Admin();

  }
}

