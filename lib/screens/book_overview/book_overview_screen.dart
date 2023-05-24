import 'package:flutter/material.dart';
import 'package:hive_test/screens/book_overview/widgets/build_favorites_or_all.dart';
import 'package:hive_test/screens/book_overview/widgets/custom_floating_action_button.dart';
import 'package:hive_test/screens/deleted_items/widgets/deleted_action_icon.dart';
import 'package:provider/provider.dart';

import '../../providers/book_provider.dart';
import 'widgets/book_grid.dart';

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var isFavorite = false;
  @override
  void initState() {
    Provider.of<BookProvider>(context, listen: false).refresh();
    Provider.of<BookProvider>(context, listen: false).refreshDeleted();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        actions: [
          BuildFavoritesOrAll(provider: provider),
          DeletedActionIcon(provider: provider),
          const SizedBox(
            width: 10,
          )
        ],
        title: const Text('My Books'),
      ),
      body: GridViewWidget(isFavorite: provider.isFavorite),
      floatingActionButton: CustomFloatingActionButton(provider: provider),
    );
  }
}
