import 'package:flutter/material.dart';

class MenuItem {
  final Text text;
  final Icon icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> itemsList = [itemEdit, itemDelete];
  static const itemDelete = MenuItem(
      text: Text(
        "Remove",
        style: TextStyle(color: Colors.red),
      ),
      icon: Icon(
        Icons.delete,
        color: Colors.red,
      ));
  static const itemEdit = MenuItem(
      text: Text("Edit"),
      icon: Icon(
        Icons.edit,
        color: Colors.black,
      ));
}
