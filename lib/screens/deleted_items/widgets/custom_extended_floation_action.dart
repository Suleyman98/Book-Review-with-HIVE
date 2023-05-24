import 'package:flutter/material.dart';

import '../../../providers/book_provider.dart';

class CustomExtendedFloatingActionButton extends StatelessWidget {
  const CustomExtendedFloatingActionButton({
    super.key,
    required this.provider,
  });

  final BookProvider provider;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () {
          provider.deletePermanently(context);
        },
        label: const Text(
          'Delete Forever',
        ));
  }
}
