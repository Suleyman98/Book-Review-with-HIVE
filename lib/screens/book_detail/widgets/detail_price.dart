import 'package:flutter/material.dart';

import '../../../models/book_model.dart';

class DetailPrice extends StatelessWidget {
  const DetailPrice({
    super.key,
    required this.items,
    required this.book,
  });

  final List<BookModel> items;
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Text(
      '${book.price!.toStringAsFixed(0)} \$',
      style: const TextStyle(
          color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
    );
  }
}
