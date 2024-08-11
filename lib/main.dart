import 'package:flutter/material.dart';
import 'package:item_tracker_app_provider/page/home_page.dart';
import 'package:item_tracker_app_provider/provider/items.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final String title = "Item Tracker App";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Item Tracker',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
          useMaterial3: true,
        ),
        home: HomePage(),
      ),
    );
  }
}
