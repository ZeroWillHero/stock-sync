import 'package:flutter/material.dart';
import 'package:stock_sync/constants/Constants.dart';

class FilterButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const FilterButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: secondaryColor,
          foregroundColor: tertiaryColor,
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
