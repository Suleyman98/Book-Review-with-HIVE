import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../../../models/book_model.dart';
import '../../../providers/book_provider.dart';

class DeletedView extends StatelessWidget {
  final BookModel model;
  final int index;
  const DeletedView({super.key, required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookProvider>(context);
    return Slidable(
      startActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            label: 'Undelete',
            backgroundColor: Colors.amber,
            onPressed: (context) {
              provider.undeleteBook(index, model);
            },
            icon: Icons.unarchive,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              CircleAvatar(
                backgroundImage: NetworkImage(model.imageUrl!),
                radius: 30,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                model.title!,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                '${model.price?.toStringAsFixed(0)} \$',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
