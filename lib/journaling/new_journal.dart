import 'package:flutter/material.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {

  @override
  Widget build(BuildContext context) {
    var questionText = const Text("Are you a good friend to yourself?",
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold));

    var backButton = SizedBox(
        width: 90,
        height: 40,
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Center(
              child: Text(
                "Done",
                style: TextStyle(
                  fontSize: 16,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            )));

    var saveButton = SizedBox(
        width: 90,
        height: 40,
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Center(
              child: Text(
                "Save",
                style: TextStyle(
                  fontSize: 16,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            )));

    var navButtons = Row(children: <Widget>[
      const Spacer(),
      backButton,
    ]);

    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(12, 32, 12, 32),
            child: Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
        children: <Widget>[
          navButtons,
          const SizedBox(height: 20),
          questionText,
          const SizedBox(height: 10),
          Card(
            color: Colors.lightBlue[50],
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                maxLines: 15, //or null 
                decoration: InputDecoration.collapsed(hintText: "Enter your text here",
                filled: false),
              ),
            )
          ),
        ],
      )
    )));
  }
}
