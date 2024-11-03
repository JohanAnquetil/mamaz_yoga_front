import 'package:flutter/material.dart';

class ListItems<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T item) itemBuilder;
  final String Function(T item) dateSelector;

  const ListItems({super.key,
    required this.items,
    required this.itemBuilder,
    required this.dateSelector,
  });

  @override
  Widget build(BuildContext context) {
    items.sort((a, b) => dateSelector(b).compareTo(dateSelector(a)));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return itemBuilder(items[index]);
        },
      ),
    );
  }
}
