import 'package:flutter/material.dart';
import 'package:item_tracker_app_provider/modal/item.dart';
import 'package:item_tracker_app_provider/widget/item_widget.dart';

class ItemListWidget extends StatelessWidget {
  const ItemListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemWidget(
      item: Item(
        createdTime: DateTime.now(),
        title: "Walk",
      ),
    );
  }
}
