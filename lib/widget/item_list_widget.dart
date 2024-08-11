import 'package:flutter/material.dart';
import 'package:item_tracker_app_provider/provider/items.dart';
import 'package:item_tracker_app_provider/widget/item_widget.dart';
import 'package:provider/provider.dart';

class ItemListWidget extends StatelessWidget {
  const ItemListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ItemsProvider>(
        context); //provider=instance of this provider
    final items = provider.items;

    return items.isEmpty
        ? Center(
            child: Text(
              'No Items',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            separatorBuilder: (context, index) => Container(
                  height: 20,
                ),
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return ItemWidget(item: item);
            });
  }
}
