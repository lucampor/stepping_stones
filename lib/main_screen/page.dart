import 'package:flutter/material.dart';
import 'package:stepping_stones/journaling/data.dart';
import 'package:stepping_stones/journaling/entry_type.dart';
import 'package:stepping_stones/objectives/data.dart';
import 'package:stepping_stones/objectives/entry.dart';
import 'package:stepping_stones/objectives/model.dart';

class GoalPage extends StatefulWidget {
  const GoalPage({super.key});

  //final String title;

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      backgroundColor:
          Colors.lightBlue, //Theme.of(context).colorScheme.primary,
      toolbarHeight: 70,
      centerTitle: true,

      title: const Center(
        child: Text(
          "My goals",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );

    var addButton = FloatingActionButton.large(
        onPressed: () {
          print("Goal page");
        },
        child: const Center(
          child: Text(
            "Add new goal",
            style: TextStyle(
              fontSize: 20,
            ),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ));

    var descriptiveText = const Center(
        child: Text(
      "What would you like to work on today?",
      style: TextStyle(fontSize: 18),
    ));

    var confidence = ObjectiveData("Improving confidence");
    var selftalk = ObjectiveData("Working on my self-talk", journalEntries: [
      JournalEntryData("Yesterday I wanted to fish a crab",
          type: EntryType.note),
      JournalEntryData("Yesterday I wanted to hunt a moose",
          type: EntryType.note)
    ]);

    var pages = [
      //descriptiveText,
      confidence,
      selftalk
    ];

    Widget selectChild(List<ObjectiveData> list) {
      if (list.length <= 1) {
        return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                      "You don't have any goal. Create your first goal and start this journey!",
                      style: TextStyle(fontSize: 24)))
            ]);
      } else {
        return ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider(
                height: 20,
                color: Colors.white,
              );
            },
            itemCount: pages.length,
            itemBuilder: (context, index) {
              var model = ObjectiveModel(pages[index]);
              return ObjectiveEntry(model);
            });
      }
    }

    return Scaffold(
      appBar: appBar,
      //bottomNavigationBar: appBar,
      body: SafeArea(
          minimum: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: selectChild(pages)),
      floatingActionButton: addButton,
    );
  }
}
