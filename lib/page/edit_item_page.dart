import 'package:flutter/material.dart';
import 'package:item_tracker_app_provider/modal/item.dart';
import 'package:item_tracker_app_provider/provider/items.dart';
import 'package:item_tracker_app_provider/widget/item_form_widget.dart';
import 'package:provider/provider.dart';

class EditItemPage extends StatefulWidget {
  const EditItemPage({super.key, required this.item});
  final Item item;

  @override
  State<EditItemPage> createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  final _formKey = GlobalKey<FormState>();

  late String title;
  late String description;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    title = widget.item.title;
    description = widget.item.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Edit Item"),
          actions: [
            IconButton(
                onPressed: () {
                  final provider =
                      Provider.of<ItemsProvider>(context, listen: false);

                  provider.removeItem(widget.item);

                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.delete))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ItemFormWidget(
              title: title,
              description: description,
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedItem: saveItem,
            ),
          ),
        ),
      );

  void saveItem() {
    final isValid = _formKey.currentState?.validate();

    if (!isValid!) {
      return;
    } else {
      final provider = Provider.of<ItemsProvider>(context, listen: false);

      provider.updateItem(widget.item, title, description);

      Navigator.of(context).pop();
    }
  }
}
