import 'package:flutter/cupertino.dart';
import 'package:item_tracker_app_provider/modal/item.dart';

class ItemsProvider extends ChangeNotifier {
  List<Item> _items = [
    Item(
      createdTime: DateTime.now(),
      title: "Sample Data",
      description: '- sample 01',
    ),
    // Item(createdTime: DateTime.now(), title: "Dog", description: "- bark"),
    // Item(createdTime: DateTime.now(), title: "Sparroe", description: "- chirp"),
  ];

  List<Item> get items => _items.where((item) => item.isDone == false).toList();

  List<Item> get itemsCompleted =>
      _items.where((item) => item.isDone == true).toList();

  void addItem(Item item) {
    _items.add(item);

    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);

    notifyListeners();
  }

  bool toggleItemStatus(Item item) {
    item.isDone = !item.isDone;
    notifyListeners();

    return item.isDone;
  }

  void updateItem(Item item, String title, String description) {
    item.title = title;
    item.description = description;

    notifyListeners();
  }
}
