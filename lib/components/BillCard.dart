import 'package:flutter/material.dart';
import 'package:stock_sync/constants/Constants.dart';

class BillCard extends StatefulWidget {
  final String billNo;
  final String shop;
  final String date;
  const BillCard({
    super.key,
    required this.billNo,
    required this.date,
    required this.shop,
  });

  @override
  State<BillCard> createState() => _BillCardState();
}

class _BillCardState extends State<BillCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
              // decoration: BoxDecoration(
              //     border: Border.all(color: tertiaryColor, width: 2.0)),
              padding: EdgeInsets.all(10.0),
              width: 355,
              height: 40,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${widget.billNo}",
                      style: TextStyle(
                        color: tertiaryColor,
                      )),
                  Text(
                    "${widget.shop}",
                    style: TextStyle(
                      color: tertiaryColor,
                    ),
                  ),
                  Text(
                    "${widget.date}",
                    style: TextStyle(
                      color: tertiaryColor,
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
