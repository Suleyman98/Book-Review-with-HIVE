import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../models/book_model.dart';
import '../../../providers/book_provider.dart';

class DetailRates extends StatelessWidget {
  const DetailRates({
    required this.book,
    super.key,
    required this.width,
  });
  final BookModel book;

  final double width;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookProvider>(context);
    return RatingBar.builder(
      initialRating: provider.boxValues[provider.findIndex(book)].rating!,
      minRating: 1,
      direction: Axis.horizontal,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        provider.setRating(rating, book);
      },
    );
  }
}
