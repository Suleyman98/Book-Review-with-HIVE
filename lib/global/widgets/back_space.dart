import 'package:flutter/material.dart';

class Backspace extends StatelessWidget {
  const Backspace({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 30,
      top: height * 0.05,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.keyboard_backspace,
          size: 42,
          color: Colors.white,
        ),
      ),
    );
  }
}
