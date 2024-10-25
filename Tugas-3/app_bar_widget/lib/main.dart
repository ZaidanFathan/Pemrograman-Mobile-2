import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Container(
            color: Colors.amber,
          ),
          leadingWidth: 100,
          title: Container(
            height: 35,
            color: Colors.red,
          ),
          centerTitle: false,
          actions: [
            Container(
              width: 50,
              // height: 1000000,
              color: Colors.purple,
            ),
            Container(
              width: 50,
              // height: 1000000,
              color: Colors.black,
            ),
            Container(
              width: 50,
              // height: 1000000,
              color: Colors.purple,
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(200),
            child: Container(
              width: 50,
              height: 200,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
