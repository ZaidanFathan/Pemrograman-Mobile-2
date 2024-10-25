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
          title: Text("Image Widget"),
        ),
        body: Center(
          child: Container(
            width: 350,
            height: 500,
            color: Colors.amber,
            child: Image.asset("images/Cat.png"),
            // child: Image(
            //   // fit: BoxFit.cover,
            //   // image: AssetImage("images/Cat.png")
            //   image: NetworkImage("https://picsum.photos/350/500"),
            // ),
          ),
        ),
      ),
    );
  }
}
