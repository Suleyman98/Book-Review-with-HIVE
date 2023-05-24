import 'package:flutter/material.dart';

import '../../../models/book_model.dart';

class DetailTitle extends StatelessWidget {
  const DetailTitle({
    super.key,
    required this.items,
    required this.book,
  });

  final List<BookModel> items;
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Text(
      book.title!,
      style: const TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}
