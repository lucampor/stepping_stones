import 'package:flutter/material.dart';
import 'package:stepping_stones/journaling/data.dart';
import 'package:stepping_stones/journaling/entry_type.dart';
import 'package:stepping_stones/objectives/model.dart';
import 'package:stepping_stones/objectives/page.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key, required this.current, required this.notifier});

  final CurrentPage current;
  final ObjectiveModel notifier;

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  @override
  Widget build(BuildContext context) {
    var questionText = const Padding(
        padding: EdgeInsets.fromLTRB(10, 20.0, 10, 0),
        child: Text("Note",
            // "Example question: Are you a good friend to yourself?", //"<journal question>"
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)));

    Scaffold journalScaffold() {
      var controller = TextEditingController();
      void save() {
        if (controller.text.isNotEmpty) {
          widget.notifier.insertJournalEntry(JournalEntryData(
              controller.text.toString(),
              type: EntryType.note));
        }
      }

      return Scaffold(
          backgroundColor: const Color(0xFFFFFFFF),
          bottomNavigationBar: BottomAppBar(
            height: 100,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              color: Colors.amber,
              child: InkWell(
                onTap: () {
                  save();
                  Navigator.pop(context);
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.local_florist,
                      size: 30,
                    ),
                    Text(
                      "Finish new journal entry",
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
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: controller,
                      onEditingComplete: save,
                      autofocus: true,
                      maxLines: 15, //or null
                      decoration: const InputDecoration.collapsed(
                          hintText: "Enter your text here", filled: false),
                    ),
                  )),
            ],
          ));
    }

    return journalScaffold();
  }
}
