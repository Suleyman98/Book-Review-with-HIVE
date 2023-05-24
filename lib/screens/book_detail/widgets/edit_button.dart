import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/utilities/add_new_book.dart';
import '../../../models/book_model.dart';
import '../../../providers/book_provider.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookProvider>(context);
    return ElevatedButton(
      onPressed: () {
        provider.title.text = book.title!;
        provider.description.text = book.description!;
        provider.img.text = book.imageUrl!;
        provider.price.text = book.price.toString();
        AddBook.addNewBook(context: context, isEdit: true, book: book);
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.grey[800],
      ),
      child: const Text(
        'Edit Book',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
