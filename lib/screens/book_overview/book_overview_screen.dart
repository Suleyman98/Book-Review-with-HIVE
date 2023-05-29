import 'package:flutter/material.dart';
import 'package:hive_test/main.dart';
import 'package:provider/provider.dart';

import 'package:hive_test/screens/book_overview/widgets/build_favorites_or_all.dart';
import 'package:hive_test/screens/book_overview/widgets/custom_floating_action_button.dart';
import 'package:hive_test/screens/deleted_items/widgets/deleted_action_icon.dart';

import '../../providers/book_provider.dart';
import 'widgets/book_grid.dart';

class ProductOverviewScreen extends StatefulWidget {
  final Function changeBool;
  final IconData iconDark;
  final IconData iconLight;

  const ProductOverviewScreen({
    Key? key,
    required this.changeBool,
    required this.iconDark,
    required this.iconLight,
  }) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
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
          IconButton(
            onPressed: () {
              widget.changeBool();
            },
            icon: Icon(iconBool ? iconDark : iconLight),
          ),
          BuildFavoritesOrAll(provider: provider),
          DeletedActionIcon(provider: provider),
          const SizedBox(
            width: 10,
          )
        ],
        title: provider.isFavorite
            ? const Text('My Favorite Books')
            : const Text('My Books'),
      ),
      body: GridViewWidget(isFavorite: provider.isFavorite),
      floatingActionButton: CustomFloatingActionButton(provider: provider),
    );
  }
}
