import 'package:flutter/material.dart';

import '../../../models/book_model.dart';

class DetailDescription extends StatelessWidget {
  const DetailDescription({
    super.key,
    required this.items,
    required this.book,
  });

  final List<BookModel> items;
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Text(
      book.description!,
      style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.5,
          wordSpacing: 1.5),
    );
  }
}
