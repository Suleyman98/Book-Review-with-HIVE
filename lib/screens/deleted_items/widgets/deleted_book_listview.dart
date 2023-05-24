import 'package:flutter/material.dart';

import '../../../providers/book_provider.dart';
import 'deleted_item_view.dart';

class DeletedItemsView extends StatelessWidget {
  const DeletedItemsView({
    super.key,
    required this.provider,
  });

  final BookProvider provider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return DeletedView(
          model: provider.deletedItems[index],
          index: index,
        );
      },
      itemCount: provider.deletedItems.length,
    );
  }
}
