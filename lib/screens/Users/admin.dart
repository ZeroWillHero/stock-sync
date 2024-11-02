import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_sync/components/NavBar.dart';
import 'package:stock_sync/components/filterButtons.dart';
import 'package:stock_sync/components/graphs/incomeGraph.dart';
import 'package:stock_sync/constants/Constants.dart';
import 'package:stock_sync/screens/AddProducts.dart';
import 'package:stock_sync/screens/Home.dart';
import 'package:stock_sync/screens/Users/ref.dart';
import 'package:stock_sync/screens/stockRef.dart';
import 'package:stock_sync/screens/stockView.dart';

class Admin extends StatelessWidget {
  const Admin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            NavBar(image: 'ref.png', user: "Admin"),

            // add ref's Widgets here
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
              ),
              child: Container(
                color: primaryColor,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      IncomeGraph(),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FilterButton(
                                buttonText: "Add Products",
                                onPressed: () {
                                  Get.to(() => Addproducts());
                                },
                              ),
                              FilterButton(
                                buttonText: "View Stock",
                                onPressed: () {
                                  Get.to(() => StockView());
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FilterButton(
                                buttonText: "Refs",
                                onPressed: () {
                                  Get.to(() => Home());
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            // edit bills
            // ElevatedButton(
            //   onPressed: () {},
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: primaryColor,
            //     foregroundColor: secondaryColor,
            //   ),
            //   child: Text("Edit Bills"),
            // )
          ],
        ),
      ),
    );
  }
}
