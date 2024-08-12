// import 'package:flutter/material.dart';

class ItemField {
  static const createdTime = 'createdTime';
}

class Item {
  DateTime createdTime;
  String title;
  String? id;
  String description;
  bool isDone;

  Item({
    required this.createdTime,
    required this.title,
    this.description = '',
    this.id,
    this.isDone = false,
  });
}

// We can build our items with this modal and create it inside of our application