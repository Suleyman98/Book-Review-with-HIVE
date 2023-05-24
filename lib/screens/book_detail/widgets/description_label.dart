import 'package:flutter/material.dart';

class DescriptionLabel extends StatelessWidget {
  const DescriptionLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Description",
      style: TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.w900),
    );
  }
}
