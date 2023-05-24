import 'package:flutter/material.dart';

import '../../../providers/book_provider.dart';

class BuildFavoritesOrAll extends StatelessWidget {
  const BuildFavoritesOrAll({
    super.key,
    required this.provider,
  });

  final BookProvider provider;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: const Text('Favorites'),
            onTap: () {
              provider.setFavoriteOrAll(true);
              provider.refresh();
            },
          ),
          PopupMenuItem(
            child: const Text('All'),
            onTap: () {
              provider.setFavoriteOrAll(false);
            },
          ),
        ];
      },
    );
  }
}
