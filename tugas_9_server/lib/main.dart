import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Server {
  final int id;
  final String title;
  final String author;
  final String category;
  final int year;
  final String publisher;

  Server({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.year,
    required this.publisher,
  });

  factory Server.fromJson(Map<String, dynamic> json) {
    return Server(
      id: int.parse(json['id']),
      title: json['title'],
      author: json['author'],
      category: json['category'],
      year: int.parse(json['publication_year']),
      publisher: json['publisher'],
    );
  }
}

Future<List<Server>> fetchServers() async {
  final response = await http
      .get(Uri.parse('http://localhost/Pemrogramanmobile2/Tugas-9/index.php'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((json) => Server.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load servers');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Server Configuration',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ServerListScreen(),
    );
  }
}

class ServerListScreen extends StatelessWidget {
  const ServerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Collections'),
      ),
      body: FutureBuilder<List<Server>>(
        future: fetchServers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final servers = snapshot.data!;
            return ListView.builder(
              itemCount: servers.length,
              itemBuilder: (context, index) {
                final server = servers[index];
                return ListTile(
                  title: Text(server.title),
                  subtitle: Text(server.author),
                  trailing: Text(server.category),
                );
              },
            );
          }
        },
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}
