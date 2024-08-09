import 'package:flutter/material.dart';
import 'package:item_tracker_app_provider/widget/item_form_widget.dart';

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
          content: Column(
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

          const SizedBox(height: 8,),

          ItemFormWidget( 
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) => setState( () => this.description = description),
            onSavedItem: (){},
          ),
        ],
      ));
}
