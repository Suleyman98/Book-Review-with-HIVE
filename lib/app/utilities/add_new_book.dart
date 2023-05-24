import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/book_model.dart';
import '../../providers/book_provider.dart';

class AddBook {
  static Future<dynamic> addNewBook(
      {required BuildContext context, required bool isEdit, BookModel? book}) {
    final provider = Provider.of<BookProvider>(context, listen: false);

    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 600,
                child: Column(
                  children: [
                    TextField(
                      controller: provider.title,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          helperText: 'Enter title',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    TextField(
                      controller: provider.img,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          helperText: 'Enter Image Url',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    TextField(
                      controller: provider.description,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          helperText: 'Enter description',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    TextField(
                      controller: provider.price,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          helperText: 'Enter Price',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    ElevatedButton(
                      child: const Text('submit'),
                      onPressed: () {
                        if (isEdit) {
                          provider.editBook(book!);
                        } else {
                          provider.addBook();
                        }
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                )),
          ));
        });
  }
}
