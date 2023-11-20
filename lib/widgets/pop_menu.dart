import 'package:flutter/material.dart';

class PopMenu extends StatefulWidget {
  const PopMenu(
      {super.key, required this.menuItem, required this.selectedItem});

  final Set<String> menuItem;
  final Function(String?) selectedItem;

  @override
  State<PopMenu> createState() => _PopMenuState();
}

class _PopMenuState extends State<PopMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) => widget.selectedItem(value),
      itemBuilder: (context) {
        return widget.menuItem.map((menuItem) {
          return PopupMenuItem(
            value: menuItem,
            child: Text(menuItem),
          );
        }).toList();
      },
    );
  }
}
