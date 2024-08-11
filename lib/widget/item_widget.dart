import 'package:flutter/material.dart';
import 'package:item_tracker_app_provider/modal/item.dart';
import 'package:item_tracker_app_provider/page/edit_item_page.dart';
import 'package:item_tracker_app_provider/provider/items.dart';
import 'package:item_tracker_app_provider/utils.dart';
import 'package:provider/provider.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) => buildItem(context);

  Widget buildItem(BuildContext context) => GestureDetector(
        onTap: () => editItem(context, item),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            color: Colors.blueGrey.shade100,
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Checkbox(
                  activeColor: Colors.pink.shade200,
                  checkColor: Colors.black,
                  value: item.isDone,
                  onChanged: (_) {
                    final provider =
                        Provider.of<ItemsProvider>(context, listen: false);
                    final isDone = provider.toggleItemStatus(item);

                    Utils.showSnackBar(
                      context,
                      isDone ? 'Task completed' : 'Task marked incomplete',
                    );
                  }, //logic to change item.isDone state
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                          fontSize: 22),
                    ),
                    if (item.description.isNotEmpty)
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        child: Text(
                          item.description,
                          style: TextStyle(fontSize: 20, height: 1.5),
                        ),
                      )
                  ],
                )),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () => editItem(context, item),
                        child: Icon(Icons.edit)),
                    ElevatedButton(
                        onPressed: () => deleteItem(context, item),
                        child: Icon(Icons.delete))
                  ],
                )
              ],
            ),
          ),
        ),
      );
}

//4.59 delete for item
//onTap: () => deleteItem(context, item)

void deleteItem(BuildContext context, Item item) {
  final provider = Provider.of<ItemsProvider>(context, listen: false);
  provider.removeItem(item);

  Utils.showSnackBar(context, "Deleted the Item");
}

void editItem(BuildContext context, Item item) =>
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => EditItemPage(item: item),
    ));
