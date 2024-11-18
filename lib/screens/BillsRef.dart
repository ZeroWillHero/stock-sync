import 'package:flutter/material.dart';
import 'package:stock_sync/components/BillCard.dart';
import 'package:stock_sync/components/NavBar.dart';
import 'package:stock_sync/constants/Constants.dart';

class BillsRef extends StatefulWidget {
  const BillsRef({super.key});

  @override
  State<BillsRef> createState() => _BillsRefState();
}

class _BillsRefState extends State<BillsRef> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Align(
            alignment: FractionalOffset(0.1, 0.6),
            child: Text(
              "All Bills",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ),

        // Body of the screen
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
              // decoration: BoxDecoration(
              //     border: Border.all(color: tertiaryColor, width: 2.0)),
              padding: const EdgeInsets.all(10.0),
              width: 355,
              height: 40,
              color: primaryColor,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Bill.No",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                      )),
                  Text(
                    "Shop",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: secondaryColor,
                    ),
                  ),
                  Text(
                    "Date",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: secondaryColor,
                    ),
                  ),
                ],
              )),
        ),

        const SizedBox(
          height: 10,
        ),

        const BillCard(billNo: "bill01", shop: "shop 02", date: "23 Mar 2024"),
      ],
    ));
  }
}
