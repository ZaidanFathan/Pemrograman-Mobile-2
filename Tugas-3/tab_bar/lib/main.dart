import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Tab> myTab = [
    Tab(
      icon: Icon(Icons.add_a_photo),
    ),
    Tab(
      icon: Icon(Icons.ac_unit_outlined),
    ),
    Tab(
      text: "Tab 3",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: DefaultTabController(
        length: myTab.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("My Apps"),
            bottom: TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              indicatorWeight: 5,
              indicatorPadding: EdgeInsets.all(10),
              // indicator: BoxDecoration(
              //     color: Colors.amber,
              //     border: Border(
              //         top: BorderSide(
              //       color: Colors.black,
              //       width: 10,
              //     ))),
              tabs: myTab,
            ),
          ),
        ),
      ),
    );
  }
}
