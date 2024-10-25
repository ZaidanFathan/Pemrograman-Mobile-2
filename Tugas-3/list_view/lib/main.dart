import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Color> myColor = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.amber,
  ];

  final List<Widget> myList =
      List.generate(100, (index) => Text("${index + 1}"));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("List View Widget"),
      ),
      // body: ListView.separated(
      //   separatorBuilder: (context, index) {
      //     return Container(
      //       height: 10,
      //     );
      //   },
      //   itemCount: myColor.length,
      //   itemBuilder: (context, index) {
      //     return myList;
      //   },
      // )

      body: ListView(
        children: myList,
      ),
      // (scrollDirection: Axis.horizontal, children: myList),
    ));
  }
}
