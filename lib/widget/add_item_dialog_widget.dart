import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
