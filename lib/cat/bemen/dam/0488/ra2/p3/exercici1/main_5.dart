import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class Message {
  final String author;
  final String body;

  Message(this.author, this.body);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    final names = [
      "Ellison Curry",
      "Briggs Willis",
      "Alexa Murphy",
      "Cameron Berry",
      "Annabelle Villarreal",
      "Nikolai Wiley",
      "Lauryn Morrow",
      "Kyree Hardy",
      "Wells Wilson",
      "Luna Foster",
      "Kayden Taylor",
      "Sofia Mann",
      "Nehemiah Randall",
      "Christina Gordon",
      "Karter Kramer",
      "Hanna Morales",
      "Megan Delarosa",
      "Osiris Johnson",
      "Emma Atkins",
      "Cason McKee",
      "Kori Walls",
      "Larry Shepherd",
    ];

    const body =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ac vestibulum nunc.";

    final random = Random();
    final messages = List.generate(
      100,
      (index) => Message(
        names[random.nextInt(names.length)],
        body,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exercici 1.5 - Message List"),
          centerTitle: true,
        ),

        body: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final msg = messages[index]; 
            return ListTile(
              leading: CircleAvatar(
                child: Text(msg.author[0]),
              ),
              title: Text(msg.author),
              subtitle: Text(msg.body),
            );
          },
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
