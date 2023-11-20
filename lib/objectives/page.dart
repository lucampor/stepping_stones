import 'package:flutter/material.dart';
import 'package:stepping_stones/journaling/data.dart';
import 'package:stepping_stones/journaling/entry_type.dart';
import 'package:stepping_stones/journaling/new_journal.dart';
import 'package:stepping_stones/journaling/list.dart';
import 'package:stepping_stones/objectives/model.dart';
import 'package:stepping_stones/stones/list.dart';

enum CurrentPage {
  journal,
  stepping
}

class ObjectivePage extends StatefulWidget {
  const ObjectivePage(
    this.notifier, {
      required this.current,
      super.key,
    }
  );

  const ObjectivePage.path(
    this.notifier, {
      this.current = CurrentPage.stepping,
      super.key
    }
  );

  const ObjectivePage.journal(
    this.notifier, {
      this.current = CurrentPage.journal,
      super.key
    }
  );

  final CurrentPage current;
  final ObjectiveModel notifier;


  @override
  State<ObjectivePage> createState() => _ObjectivePageState();
}

class _ObjectivePageState extends State<ObjectivePage> {


  bool isJournal(CurrentPage page) { return page == CurrentPage.journal; }


  AppBar appBar() {
    var section = isJournal(widget.current) ? "Journal of:\n" : "Stepping Stones of:\n";

    return AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          centerTitle: true,
          backgroundColor: Colors.lightBlue,//Theme.of(context).colorScheme.tertiary,
          // actions: const [
          //   Icon(Icons.filter_alt_rounded, size: 60, color: Colors.black,)
          // ]

          title: ListenableBuilder(
            listenable: widget.notifier,
            builder: (context, child) {
              final String goal = widget.notifier.name;

              return RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: section,
                    children: [TextSpan(
                        text: goal,
                        style: const TextStyle(fontWeight: FontWeight.bold)
                    )],
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.black
                    ),
                  )
                );
            }
          ),
        );
  }

  BottomAppBar bottomBar() {
    var switchTo = isJournal(widget.current) ? "Switch to\nStepping Stones" : "Switch to Journal";
    var switchIcon = !isJournal(widget.current) ? Icons.auto_stories : Icons.hive_outlined;

    var nextScreen = isJournal(widget.current) ? ObjectivePage.path(widget.notifier) : ObjectivePage.journal(widget.notifier);

    return BottomAppBar(
      height: 100,
      padding: const EdgeInsets.all(0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              color: Colors.amber,
              child: InkWell(
                  onTap: () { Navigator.pop(context); },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.local_florist,
                        size: 40,
                      ),
                      Text("Go back\nto your Goals",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          ),
          Expanded(child: InkWell(
              onTap: () {Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) =>
                    nextScreen
                  )
              );},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(switchIcon,
                    size: 40,
                  ),
                  Text(switchTo,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  FloatingActionButton addButton() {
    var newEntry = isJournal(widget.current) ? "Journal Entry" : "Stepping Stone";
    var newIcon = isJournal(widget.current) ? Icons.auto_stories : Icons.hive_outlined;

    return FloatingActionButton.extended(
      onPressed: (){
        isJournal(widget.current) ? 
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => const JournalPage()))
        : 
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => const JournalPage()));
      },
      backgroundColor: Colors.lightBlue,
      label: Row(
        children: [
          Icon(newIcon,
            size: 40,
          ),
          Text("Add new\n$newEntry",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var currentEmptyMsg = isJournal(widget.current) ? "journal entries" : "stepping stones";
    var emptyMessage = Text("You have no $currentEmptyMsg yet!\nLet's add the first one!",
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 30
      ),
    );


    return Scaffold(
        appBar: appBar(),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          child: ListenableBuilder(
            listenable: widget.notifier,
            builder: (context, child) {
              var currentList = isJournal(widget.current) ? JournalList(widget.notifier) : SteppingStoneList(widget.notifier);
              return Stack(
                children: [
                  Center(
                    child: (widget.notifier.isEmpty(widget.current) ? emptyMessage : currentList)
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: addButton()
                  )
                ],
              );
            }
          ) ,
        ),
        //
        // add_task_sharp

        // TODO Stretch buttons & add top padding
        bottomNavigationBar: bottomBar(),
    );
  }
}
