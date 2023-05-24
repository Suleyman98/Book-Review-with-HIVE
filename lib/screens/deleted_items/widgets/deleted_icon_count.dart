import 'package:flutter/material.dart';

import '../../../providers/book_provider.dart';

class DeletedCountIcon extends StatelessWidget {
  const DeletedCountIcon({
    super.key,
    required this.provider,
  });

  final BookProvider provider;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 2,
      right: 2,
      child: provider.deletedItems.isNotEmpty
          ? Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              width: 20,
              height: 20,
              child: Text(
                provider.deletedItems.length.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
