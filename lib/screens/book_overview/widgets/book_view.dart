import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/utilities/add_new_book.dart';
import '../../../models/book_model.dart';
import '../../../providers/book_provider.dart';
import '../../book_detail/book_detail_screen.dart';

class BookView extends StatelessWidget {
  final BookModel book;
  const BookView({super.key, required this.book});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookProvider>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(book.title!),
          leading: IconButton(
            onPressed: () {
              provider.title.text = book.title!;
              provider.description.text = book.description!;
              provider.img.text = book.imageUrl!;
              provider.price.text = book.price.toString();
              AddBook.addNewBook(
                context: context,
                isEdit: true,
                book: book,
              );
            },
            color: Theme.of(context).primaryColor,
            icon: const Icon(Icons.edit),
          ),
          trailing: IconButton(
              onPressed: () {
                provider.deleteBook(book);
              },
              icon: Icon(Icons.delete, color: Theme.of(context).primaryColor)),
        ),
        child: GestureDetector(
          child: Image.network(
            book.imageUrl!,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPage(
                book: book,
              );
            }));
          },
        ),
      ),
    );
  }
}
