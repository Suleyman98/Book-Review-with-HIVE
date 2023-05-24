import 'package:flutter/material.dart';

import '../../../models/book_model.dart';

class DetailImage extends StatelessWidget {
  const DetailImage({
    super.key,
    required this.book,
    required this.height,
    required this.items,
  });

  final BookModel book;
  final double height;
  final List<BookModel> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.55,
      decoration: BoxDecoration(
          image: DecorationImage(
              alignment: Alignment.topCenter,
              image: NetworkImage(book.imageUrl!),
              fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.black.withOpacity(0.9),
          Colors.black.withOpacity(0.5),
          Colors.black.withOpacity(0.0),
          Colors.black.withOpacity(0.0),
          Colors.black.withOpacity(0.5),
          Colors.black.withOpacity(0.9),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      ),
    );
  }
}
