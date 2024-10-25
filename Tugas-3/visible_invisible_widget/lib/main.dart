import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            "Column",
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 150,
              height: 50,
              color: Colors.green,
            ),
            Container(
              width: 100,
              height: 50,
              color: Colors.deepOrange,
            ),
            Container(
              width: 50,
              height: 50,
              color: Colors.deepOrange,
            ),
            Container(
              width: 90,
              height: 50,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
