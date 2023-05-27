import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/book_provider.dart';

class CustomFilterChip extends StatelessWidget {
  const CustomFilterChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _titleContainer("Choose by price"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Align(
            alignment: Alignment.center,
            child: Wrap(
              spacing: 5.0,
              runSpacing: 3.0,
              children: <Widget>[
                FilterChipWidget(chipName: 'Cheapest'),
                FilterChipWidget(chipName: 'Most Expensive'),
              ],
            ),
          ),
        ),
        const Divider(
          color: Colors.teal,
          height: 10.0,
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _titleContainer('Choose by rating'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Align(
            alignment: Alignment.center,
            child: Wrap(
              spacing: 5.0,
              runSpacing: 5.0,
              children: <Widget>[
                FilterChipWidget(chipName: 'Most Rated'),
                FilterChipWidget(chipName: 'Less Rated'),
              ],
            ),
          ),
        ),
        const Divider(
          color: Colors.teal,
          height: 10.0,
        ),
      ],
    );
  }
}

Widget _titleContainer(String myTitle) {
  return Text(
    myTitle,
    style: const TextStyle(
        color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
  );
}

class FilterChipWidget extends StatefulWidget {
  final String chipName;

  FilterChipWidget({super.key, required this.chipName});

  @override
  _FilterChipWidgetState createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookProvider>(context);
    return FilterChip(
      label: Text(widget.chipName),
      labelStyle: const TextStyle(
          color: Colors.teal, fontSize: 14.0, fontWeight: FontWeight.bold),
      selected: provider.selectedFilters.contains(widget.chipName)
          ? true
          : _isSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      backgroundColor: const Color(0xffededed),
      onSelected: (isSelected) {
        if (isSelected) {
          provider.addNewFilter(widget.chipName);
        } else {
          provider.removeFilter(widget.chipName);
        }
        provider.filterItems();
        setState(() {
          _isSelected = isSelected;
        });
      },
      selectedColor: const Color(0xffeadffd),
    );
  }
}
