import 'package:flutter/material.dart';

import '../../../app/utilities/add_new_book.dart';
import '../../../providers/book_provider.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, required this.provider});

  final BookProvider provider;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          AddBook.addNewBook(context: context, isEdit: false);
          provider.cleanInputs();
        },
        child: const Icon(Icons.add));
  }
}
