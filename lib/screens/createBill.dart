import 'package:flutter/material.dart';
import 'package:stock_sync/components/billFields.dart';

import '../constants/Constants.dart';

class Createbill extends StatefulWidget {
  const Createbill({super.key});

  @override
  State<Createbill> createState() => _CreatebillState();
}

class _CreatebillState extends State<Createbill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 60),
              const Text (
                "Create Bill",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: tertiaryColor,
                )
              ),

              BillFields(),
            ],
          ),
        )
      )
    );
  }
}
