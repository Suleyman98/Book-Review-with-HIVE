import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/book_model.dart';
import '../../../providers/book_provider.dart';

class DetailFavorite extends StatelessWidget {
  const DetailFavorite({
    super.key,
    required this.height,
    required this.book,
  });

  final double height;

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookProvider>(context);

    return Positioned(
      right: 30,
      top: height * 0.45,
      child: GestureDetector(
        onTap: () {
          provider.toggleFavorite(book);
          // print(
          //     provider.boxValues[provider.findIndex(widget.book)].isFavorite!);
        },
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 5,
                    spreadRadius: 1)
              ]),
          child: Icon(
            Icons.favorite,
            size: 45,
            color: provider.boxValues[provider.findIndex(book)].isFavorite!
                ? Colors.red
                : Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
