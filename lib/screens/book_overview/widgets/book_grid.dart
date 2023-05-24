import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/book_provider.dart';
import 'book_view.dart';
import 'filter_books.dart';

class GridViewWidget extends StatelessWidget {
  final bool isFavorite;
  const GridViewWidget({super.key, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<BookProvider>(context);
    final provider = Provider.of<BookProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(17.0),
          child: TextFormField(
            controller: provider.search,
            onChanged: (value) {
              provider.searchBook(provider.usedBooks);
            },
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.import_contacts),
              suffixIcon: !provider.isFavorite
                  ? IconButton(
                      icon: const Icon(Icons.tune),
                      onPressed: () {
                        provider.setFilterScreen();
                      },
                    )
                  : const SizedBox.shrink(),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              contentPadding: const EdgeInsets.all(5),
              hintText: 'Search for a book...',
            ),
          ),
        ),
        (provider.isFiltering && !provider.isFavorite)
            ? const CustomFilterChip()
            : const SizedBox.shrink(),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: provider.search.text != ''
                ? provider.searchedBooks.length
                : provider.usedBooks.length,
            itemBuilder: (context, index) {
              return BookView(
                book: provider.search.text != ''
                    ? provider.searchedBooks[index]
                    : provider.usedBooks[index],
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          ),
        ),
      ],
    );
  }
}
