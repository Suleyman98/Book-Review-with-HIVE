import 'package:flutter/material.dart';
import 'package:hive_test/screens/book_detail/widgets/detail_container.dart';
import 'package:hive_test/screens/book_detail/widgets/detail_favorite.dart';
import 'package:hive_test/screens/book_detail/widgets/detail_image.dart';
import 'package:provider/provider.dart';
import '../../global/widgets/back_space.dart';
import '../../models/book_model.dart';
import '../../providers/book_provider.dart';

class DetailPage extends StatelessWidget {
  final BookModel book;
  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<BookProvider>(context).items;
    // final provider = Provider.of<BookProvider>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          child: Stack(
            children: <Widget>[
              DetailImage(book: book, height: height, items: items),
              DetailContainer(
                width: width,
                height: height,
                items: items,
                book: book,
              ),
              Backspace(height: height),
              DetailFavorite(
                height: height,
                book: book,
              )
            ],
          ),
        ),
      ),
    );
  }
}
