import 'package:flutter/material.dart';
import 'package:item_tracker_app_provider/main.dart';
import 'package:item_tracker_app_provider/widget/add_item_dialog_widget.dart';
import 'package:item_tracker_app_provider/widget/completed_list_widget.dart';
import 'package:item_tracker_app_provider/widget/item_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      ItemListWidget(),
      CompletedListWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white.withOpacity(0.7),
          selectedItemColor: Colors.white,
          currentIndex: selectedIndex,
          onTap: (index) => setState(() {
                selectedIndex = index;
              }),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined),
              label: 'Items',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.done),
              label: 'Completed',
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        onPressed: () => showDialog(
          context: context,
          // child: AddItemDialogWidget(),
          builder: (BuildContext context) {
            return AddItemDialogWidget();
          },
          barrierDismissible: false,
        ),
        child: Icon(Icons.add),
      ),
      body: tabs[selectedIndex],
    );
  }
}


//16.24