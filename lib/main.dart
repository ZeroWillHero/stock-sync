import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_sync/controllers/userControllers/registerController.dart';
import 'package:stock_sync/repository/authentication_repo.dart';
import 'package:stock_sync/routes/routes.dart';
import 'package:stock_sync/firebase_options.dart';
import 'package:stock_sync/repository/authentication_repo.dart';
import 'package:stock_sync/routes/routes.dart';
import 'package:stock_sync/screens/AddProducts.dart';
import 'package:stock_sync/screens/BillsRef.dart';
import 'package:stock_sync/screens/Home.dart';
import 'package:stock_sync/screens/Login.dart';
import 'package:stock_sync/screens/Register.dart';
import 'package:stock_sync/screens/Users/admin.dart';
import 'package:stock_sync/screens/Users/ref.dart';
import 'package:stock_sync/screens/stockRef.dart';
import 'package:stock_sync/screens/stockView.dart';

import 'firebase_options.dart';
// import 'package:stocksync/screens/Home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepo()));

  runApp(const StockSync());
}

class StockSync extends StatefulWidget {
  const StockSync({super.key});



  @override
  State<StockSync> createState() => _StockSyncState();
}

class _StockSyncState extends State<StockSync> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Stock Sync",
      initialRoute: '/register',
      getPages: AppRoutes.routes,
    );
  }
}
