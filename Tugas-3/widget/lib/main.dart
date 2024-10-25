// Widget Dasar, Text Widget, Visible dan Invisible Widget
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
        appBar:
            AppBar(title: Text("My Apps"), backgroundColor: Colors.blue[600]),
        body: Center(
          child: Text(
            "HalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHalloHallo",
            textAlign: TextAlign.center,
            style: TextStyle(
                backgroundColor: Colors.orange,
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
                letterSpacing: 10),
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
