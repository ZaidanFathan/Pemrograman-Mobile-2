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
          title: Text("List Tile"),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text("Zaidan Fathan"),
              subtitle: Text(
                "This is subtitle Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur",
                maxLines: 2,
              ),
              dense: true,
              leading: CircleAvatar(),
              trailing: Text("10:10PM"),
              tileColor: Colors.amber,
            ),
            Divider(),
            ListTile(
              title: Text("Zaidan Fathan"),
              subtitle: Text("This is subtitle"),
              leading: CircleAvatar(),
              trailing: Text("10:10PM"),
            ),
            Divider(),
            ListTile(
              title: Text("Zaidan Fathan"),
              subtitle: Text("This is subtitle"),
              leading: CircleAvatar(),
              trailing: Text("10:10PM"),
            ),
            Divider(),
            ListTile(
              title: Text("Zaidan Fathan"),
              subtitle: Text("This is subtitle"),
              leading: CircleAvatar(),
              trailing: Text("10:10PM"),
            ),
            Divider(),
            ListTile(
              title: Text("Zaidan Fathan"),
              subtitle: Text("This is subtitle"),
              leading: CircleAvatar(),
              trailing: Text("10:10PM"),
            ),
            Divider(),
            ListTile(
              title: Text("Zaidan Fathan"),
              subtitle: Text("This is subtitle"),
              leading: CircleAvatar(),
              trailing: Text("10:10PM"),
            ),
          ],
        ),
      ),
    );
  }
}
