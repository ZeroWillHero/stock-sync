import 'package:flutter/material.dart';
import 'package:stock_sync/constants/Constants.dart';

class StockCard extends StatefulWidget {
  final String productName;
  final int amount;
  final double price;
  const StockCard(
      {super.key,
      required this.productName,
      required this.amount,
      required this.price});

  @override
  State<StockCard> createState() => _StockCardState();
}

class _StockCardState extends State<StockCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.productName, style: TextStyle(color: secondaryColor)),
          Text("${widget.amount}", style: TextStyle(color: secondaryColor)),
          Text("${widget.price}", style: TextStyle(color: secondaryColor)),
        ],
      ),
    );
  }
}
