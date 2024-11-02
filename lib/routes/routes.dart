import 'package:get/get.dart';
import 'package:stock_sync/screens/splashScreen.dart';
import 'package:stock_sync/screens/Register.dart';
import 'package:stock_sync/screens/Home.dart';
// Add other imports as needed

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => SplashScreen()), // Add this line
    GetPage(name: '/register', page: () => Register()),
    GetPage(name: '/home', page: () => Home()),
    // Add other routes as needed
  ];
}