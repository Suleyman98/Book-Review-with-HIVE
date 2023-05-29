import 'package:awesome_dialog/awesome_dialog.dart';
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
                height: 500,
                child: Form(
                  key: provider.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || value == '') {
                            return 'Please enter a title';
                          } else {
                            return null;
                          }
                        },
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
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || value == '') {
                            return 'Please enter an Image Url';
                          } else {
                            return null;
                          }
                        },
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
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || value == '') {
                            return 'Please enter a description for this book';
                          } else {
                            return null;
                          }
                        },
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
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || value == '') {
                            return 'Please enter a price';
                          } else {
                            return null;
                          }
                        },
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
                      AnimatedButton(
                        text: isEdit ? 'Edit book' : 'Add book',
                        color: Colors.green,
                        pressEvent: () {
                          if (provider.formKey.currentState!.validate()) {
                            if (isEdit) {
                              provider.editBook(book!);
                              Navigator.of(context).pop();
                              addDialog(context, 'Book Edited').show();
                            } else {
                              Navigator.of(context).pop();
                              addDialog(context, 'Book Added').show();

                              provider.addBook();
                            }
                          }
                        },
                      ),
                    ],
                  ),
                )),
          ));
        });
  }

  static AwesomeDialog addDialog(BuildContext context, String text) {
    return AwesomeDialog(
      context: context,
      animType: AnimType.leftSlide,
      headerAnimationLoop: false,
      dialogType: DialogType.success,
      showCloseIcon: true,
      title: 'Success',
      desc: text,
      btnOkOnPress: () {
        Navigator.of(context).pop();
      },
      btnOkIcon: Icons.check_circle,
      onDismissCallback: (type) {
        Navigator.of(context).pop();
      },
    );
  }
}
