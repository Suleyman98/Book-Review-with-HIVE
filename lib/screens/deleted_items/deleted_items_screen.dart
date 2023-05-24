import 'package:flutter/material.dart';
import 'package:hive_test/screens/deleted_items/widgets/deleted_book_listview.dart';
import 'package:provider/provider.dart';

import '../../providers/book_provider.dart';
import 'widgets/custom_extended_floation_action.dart';

class DeleteItems extends StatefulWidget {
  const DeleteItems({super.key});

  @override
  State<DeleteItems> createState() => _DeleteItemsState();
}

class _DeleteItemsState extends State<DeleteItems> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookProvider>(context);
    return Scaffold(
      floatingActionButton:
          CustomExtendedFloatingActionButton(provider: provider),
      appBar: AppBar(
        elevation: 0,
        title: const Text('Deleted Items'),
      ),
      body: DeletedItemsView(provider: provider),
    );
  }
}
