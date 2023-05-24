import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../providers/book_provider.dart';
import 'deleted_icon_count.dart';

class DeletedActionIcon extends StatelessWidget {
  const DeletedActionIcon({
    super.key,
    required this.provider,
  });

  final BookProvider provider;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.none,
      children: [
        IconButton(
          icon: const Icon(Icons.delete_forever),
          onPressed: () {
            Navigator.pushNamed(context, '/deleted');
          },
        ),
        DeletedCountIcon(provider: provider)
      ],
    );
  }
}
