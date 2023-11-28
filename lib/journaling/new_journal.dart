import 'package:flutter/material.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {

  @override
  Widget build(BuildContext context) {
    var questionText = const Text("<journal question>",//Are you a good friend to yourself?",
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
        bottomNavigationBar: BottomAppBar(
      height: 100,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        color: Colors.amber,
        child: InkWell(
            onTap: () { Navigator.pop(context); },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.local_florist,
                  size: 30,
                ),
                Text("Finish new journal entry",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
      ),
    ),
        appBar: AppBar(
      backgroundColor:
          Colors.lightBlue, //Theme.of(context).colorScheme.primary,
      toolbarHeight: 70,
      centerTitle: true,

      title: const Center(
        child: Text(
          "New journal entry",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    ),
        body: Column(
        children: <Widget>[
          //navButtons,
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
      ));
  }
}
