import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Extract Widget"),
          ),
          body: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              return ChatItem(
                imageUrl: faker.image.image(
                    width: 1200,
                    height: 900,
                    keywords: ['people', 'nature'],
                    random: true),
                title: faker.job.title(),
                subtitle: faker.lorem.words(10).join(" "),
              );
            },
          )
          // ListView(
          //   children: [
          //     ChatItem(
          //       imageUrl: faker.image.image(
          //           width: 1200,
          //           height: 900,
          //           keywords: ['people', 'nature'],
          //           random: true),
          //       title: faker.job.title(),
          //       subtitle: faker.lorem
          //           .words(10)
          //           .join(" "), // Join words into a single string
          //     ),
          //     ChatItem(
          //       imageUrl: faker.image.image(
          //           width: 1200,
          //           height: 900,
          //           keywords: ['people', 'nature'],
          //           random: true),
          //       title: faker.job.title(),
          //       subtitle: faker.lorem
          //           .words(10)
          //           .join(" "), // Join words into a single string
          //     ),
          //     ChatItem(
          //       imageUrl: faker.image.image(
          //           width: 1200,
          //           height: 900,
          //           keywords: ['people', 'nature'],
          //           random: true),
          //       title: faker.job.title(),
          //       subtitle: faker.lorem
          //           .words(10)
          //           .join(" "), // Join words into a single string
          //     ),
          //   ],
          // ),
          ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String imageUrl; // Make this non-nullable
  final String? title;
  final String? subtitle;

  ChatItem({
    required this.imageUrl, // Require this parameter
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(title ?? ''), // Handle null title
      subtitle: Text(subtitle ?? ''), // Handle null subtitle
      trailing: Text("10:00 PM"),
    );
  }
}
