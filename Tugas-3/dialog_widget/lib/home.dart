import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String data = 'Belum ada input';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog"),
      ),
      body: Center(
        child: Text(
          data,
          style: TextStyle(fontSize: 35),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          print("Telah diklik");
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Confirm"),
                  content: Text("Are you sure to delete this item"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          data = "false";
                        });
                        Navigator.of(context).pop(false);
                      },
                      child: Text("No"),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          data = "true";
                        });
                        Navigator.of(context).pop(true);
                      },
                      child: Text("Yes"),
                    )
                  ],
                );
              }).then((value) => print(value));
        },
        child: Icon(Icons.card_giftcard_sharp),
      ),
    );
  }
}
