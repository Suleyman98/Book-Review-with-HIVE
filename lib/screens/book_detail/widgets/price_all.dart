import 'package:flutter/material.dart';
import 'package:hive_test/screens/book_detail/widgets/price_label.dart';

import '../../../models/book_model.dart';
import 'detail_price.dart';

class PriceAll extends StatelessWidget {
  const PriceAll({
    super.key,
    required this.items,
    required this.book,
  });

  final List<BookModel> items;
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const PriceLabel(),
        DetailPrice(items: items, book: book)
      ],
    );
  }
}
