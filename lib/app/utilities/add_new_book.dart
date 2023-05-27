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
                height: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: provider.title,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            fontSize: 12,
                          ),
                          alignLabelWithHint: true,
                          hintText: "Enter a title for this book",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: provider.img,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            fontSize: 12,
                          ),
                          alignLabelWithHint: true,
                          hintText: "Enter a title for this book",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: provider.description,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            fontSize: 12,
                          ),
                          alignLabelWithHint: true,
                          hintText: "Enter a title for this book",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: provider.price,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            fontSize: 12,
                          ),
                          alignLabelWithHint: true,
                          hintText: "Enter a title for this book",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20)),
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
