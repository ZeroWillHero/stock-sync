import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_sync/components/NavBar.dart';
import 'package:stock_sync/components/filterButtons.dart';
import 'package:stock_sync/components/graphs/incomeGraph.dart';
import 'package:stock_sync/constants/Constants.dart';
import 'package:stock_sync/screens/allBills.dart';
import 'package:stock_sync/screens/createBill.dart';

class Ref extends StatefulWidget {
  const Ref({super.key});

  @override
  State<Ref> createState() => _RefState();
}

class _RefState extends State<Ref> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            NavBar(image: 'admin.png', user: "Ref@User"),

            // add ref's Widgets here
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                ),
                child: Container(
                  color: primaryColor,
                  child: SingleChildScrollView(
                    
                    child: Column(
                      children: [
                        const Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: Text("Welcome Ref!",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: secondaryColor,
                              ),
                          ),
                        ),

                        Align(
                          alignment: Alignment.centerLeft,

                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10,0,0,0),
                            child: ElevatedButton(onPressed: () {
                              Get.to(() => const Createbill());
                            },
                              style : ElevatedButton.styleFrom(
                                backgroundColor: tertiaryColor,
                                foregroundColor: secondaryColor,
                              ),
                              child: Text("Create Bill + "),
                            ),
                          ),),


                        SizedBox(height: 10),
                        // top filter buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FilterButton(
                              buttonText: "All",
                              onPressed: () {
                                Get.to(() => const AllBills());
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        // add ref's Widgets here
                        Text(
                          "Your Stats",
                          style: TextStyle(
                              fontSize: 20,
                              color: secondaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 50,
                            color: secondaryColor,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Total Income",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "3458.00",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
              
                        IncomeGraph(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
