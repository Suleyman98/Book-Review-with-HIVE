import 'package:flutter/material.dart';

class PriceLabel extends StatelessWidget {
  const PriceLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Price",
      style: TextStyle(
          color: Colors.grey[500], fontSize: 16, fontWeight: FontWeight.w600),
    );
  }
}
