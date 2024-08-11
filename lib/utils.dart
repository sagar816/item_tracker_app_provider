import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext context, String text) =>
      // Scaffold.of(context)
      //   ..removeCurrentSnackBar()
      //   ..showSnackBar(SnackBar(content: Text(text)));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(text)),
      );
}
