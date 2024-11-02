import 'package:flutter/material.dart';

class BillData extends StatefulWidget {
  final String shop;
  final String date;
  final double total;
  final String status;

  const BillData({
    super.key,
    required this.shop,
    required this.date,
    required this.total,
    required this.status,
  });

  @override
  State<BillData> createState() => _BillDataState();
}

class _BillDataState extends State<BillData> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.shop),
            Text(widget.date),
            Text(widget.total.toString()),
            Text(widget.status),
          ],
        ),
      ),
    );
  }
}