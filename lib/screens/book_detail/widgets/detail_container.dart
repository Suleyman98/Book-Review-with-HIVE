import 'package:flutter/material.dart';
import 'package:hive_test/screens/book_detail/widgets/price_all.dart';

import '../../../models/book_model.dart';
import 'description_label.dart';
import 'detail_description.dart';
import 'detail_rates.dart';
import 'detail_title.dart';

class DetailContainer extends StatelessWidget {
  const DetailContainer({
    super.key,
    required this.width,
    required this.height,
    required this.items,
    required this.book,
  });

  final double width;
  final double height;
  final List<BookModel> items;
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.only(top: height * 0.5),
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DetailTitle(items: items, book: book),
          const SizedBox(
            height: 5,
          ),
          DetailRates(width: width, book: book),
          const SizedBox(
            height: 10,
          ),
          const DescriptionLabel(),
          const SizedBox(
            height: 8,
          ),
          DetailDescription(items: items, book: book),
          const SizedBox(
            height: 20,
          ),
          PriceAll(items: items, book: book),
        ],
      ),
    );
  }
}
