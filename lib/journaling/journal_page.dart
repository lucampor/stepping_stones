import 'package:flutter/material.dart';
import 'package:stepping_stones/main_screen/objective.dart';

class JournalPage extends StatefulWidget {
  const JournalPage(
    this.goal, {
    super.key,
  });

  final String goal;

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  @override
  Widget build(BuildContext context) {
    var entries = [
      const Objective("Hadlfaksjdlfaksfj"),
    ];

    var addEntryButton = FloatingActionButton.large(
          onPressed: (){print("Goal page");},
          child: const Text("Add new\njournal entry",
              style: TextStyle(
                fontSize: 20,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            )
        );

    var entryList = ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 20, color: Colors.white,
                    );
                  },

                  itemCount: entries.length,
                  itemBuilder: (context, index) {
                    return entries[index];
                  }
                );
var journalBar = AppBar(
  automaticallyImplyLeading: false,
          toolbarHeight: 100,
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          // actions: const [
          //   Icon(Icons.filter_alt_rounded, size: 60, color: Colors.black,)
          // ],

          title: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Journal of the goal:\n",
                children: [TextSpan(
                    text: widget.goal,
                    style: const TextStyle(fontWeight: FontWeight.bold)
                )],
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black
                ),
              )
            ),
        );
    var column = Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  entryList,
                  // Align(alignment: Alignment.bottomRight,
                  //   child: addEntryButton
                  // ),
                ],
              ),
            ),
          ],
        );


    return Scaffold(
        appBar: journalBar,
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: column,
        ),
        bottomNavigationBar: BottomAppBar(
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: InkWell(
                  onTap: () { Navigator.pop(context); },
                  child: const Text("Go to\nyour Goals",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Expanded(child: InkWell(
                  onTap: () {  },
                  child: const Text("Add new journal entry",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
