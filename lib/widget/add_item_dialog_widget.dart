import 'package:flutter/material.dart';
import 'package:item_tracker_app_provider/modal/item.dart';
import 'package:item_tracker_app_provider/provider/items.dart';
import 'package:item_tracker_app_provider/widget/item_form_widget.dart';
import 'package:provider/provider.dart';

class AddItemDialogWidget extends StatefulWidget {
  const AddItemDialogWidget({super.key});

  @override
  State<AddItemDialogWidget> createState() => _AddItemDialogWidgetState();
}

class _AddItemDialogWidgetState extends State<AddItemDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
          content: Form(
        //key is useful to validate all the fields here title
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add ToDo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ItemFormWidget(
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedItem: addItem,
            ),
          ],
        ),
      ));

  void addItem() {
    final isValid = _formKey.currentState?.validate();

    if (!isValid!) {
      return;
    } else {
      final item = Item(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now(),
      );

      final provider = Provider.of<ItemsProvider>(context, listen: false);
      provider.addItem(item);

      Navigator.of(context).pop();
    }
  }
}
