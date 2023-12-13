import 'package:flutter/material.dart';
import 'package:stepping_stones/journaling/model.dart';

const journalQuestions = {
  "Create a Positive Mindset": [
    "How did maintaining a gratitude journal influence your overall mindset?",
    "What changes did you observe by challenging negative thoughts with affirmations?",
    "In what ways did mindfulness or meditation practices contribute to your well-being?",
    "How did positive influences in your environment impact your mindset?",
    "What did you learn from celebrating small victories or achievements?",
    "How did limiting exposure to negative media affect your outlook on life?",
  ],
  "Improve Social Skills": [
    "How did maintaining eye contact impact the quality of your conversations?",
    "Consider the impact of small talk on expanding your social network.",
    "What feedback did you receive on your social interactions, and how did it guide your improvement?",
    "What are some emotions and nuances conveyed through sustained eye contact?",
  ],
  "Reduce Rejection Sensitivity": [
    "How did mindfulness and relaxation techniques influence your ability to navigate social interactions with reduced sensitivity?",
    "What do you think can be the worst-case scenario if rejected? Is this situation manageable?",
    "Can you spot irrational beliefs in your thinking?",
    "Does it say anything about you as a person, if someone rejects you?",
  ],
  "Strengthen Self-Expression": [
    "How did writing a letter expressing your feelings enhance your self-expression?",
    "What creative expression activity did you find most fulfilling?",
    "In what ways did sharing an opinion or idea in a group setting boost your self-confidence?",
    "How did joining a club related to your interests contribute to your self-expression?",
  ],
  "Deepen Existing Relationships": [
    "How can vulnerability strengthen emotional bonds?",
    "What meaningful activities did you engage in to deepen your connections during dedicated quality time?",
    "How did the expression of appreciation influence the dynamics of your relationships?",
  ],
  "Find Romance": [
    "Out of your desired qualities in a romantic partner, what are qualities you can personally embody?",
    "What did you learn from exploring online dating, and how did it contribute to your journey in finding romance?",
    "How did you navigate rejection, and what lessons did you learn from those experiences?",
    "Do you find yourself contorting who you are to appeal to other people? Why do you think you do that?",
    "Do you believe that someone will love your true self, why or why not?",
  ],
};

class JournalPage extends StatefulWidget {
  const JournalPage(this.notifier, {super.key, this.newEntry = true});

  final JournalModel notifier;
  final bool newEntry;
  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {

  var _empty = true;
  late TextEditingController _controller;
  List<String> _questions = [];

  @override
  void initState() {
    _controller = TextEditingController(text: widget.notifier.content);
    _questions = [emptyQuestion] + (journalQuestions[widget.notifier.goal] ?? []);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

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

    var bottomBar = _controller.text.isNotEmpty ?
      BottomAppBar(
          height: 100,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            color: Colors.amber,
            child: InkWell(
                onTap: () {
                  widget.notifier.changeContent(_controller.text.trim());
                  if (widget.newEntry) {
                    widget.notifier.finishEntry();
                  } else {
                    widget.notifier.modifyEntry();
                  }
                  Navigator.pop(context); },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.auto_stories,
                      size: 30,
                    ),
                    Text(widget.newEntry ? "Finish new journal entry" : "Modify journal entry",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
        ),
      ) : null;

    return ListenableBuilder(
      listenable: widget.notifier,
      builder: (context, child) {
        var text = widget.notifier.question;

        return Scaffold(
            backgroundColor: const Color(0xFFFFFFFF),
            bottomNavigationBar: bottomBar,
            appBar: AppBar(
          backgroundColor:
              Colors.lightBlue, //Theme.of(context).colorScheme.primary,
          toolbarHeight: 70,
          centerTitle: true,

          title: Center(
            child: Text(
              widget.newEntry ? "Adding new journal entry" : "Journal entry",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
            body: Column(
            children: <Widget>[
              //navButtons,
              DropdownButton(
                value: text,
                iconSize: 0,
                isExpanded: true,
                hint: const Text("Select a question"),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                underline: const Text(""),
                style: const TextStyle(
                  fontSize: 18,
                  overflow: TextOverflow.visible,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                items: _questions.map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e))).toList(),
                onChanged: (newQuestion) => widget.notifier.changeQuestion(newQuestion),
              ),
              Card(
                color: Colors.lightBlue[50],
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: _controller,
                    maxLines: 15,
                    expands: false,
                    onChanged: (_)=> setState(() {}),
                    decoration: const InputDecoration.collapsed(
                      hintText: "Enter your text here",
                      filled: false
                    ),
                  ),
                )
              ),
            ],
          ));
      }
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:stepping_stones/journaling/data.dart';
// import 'package:stepping_stones/journaling/entry_type.dart';
// import 'package:stepping_stones/objectives/model.dart';
// import 'package:stepping_stones/objectives/page.dart';


// class JournalPage extends StatefulWidget {
//   const JournalPage({super.key, required this.current, required this.notifier});
//   final CurrentPage current;
//   final ObjectiveModel notifier;

//   @override
//   State<JournalPage> createState() => _JournalPageState();
// }

// class _JournalPageState extends State<JournalPage> {
//   late List<JournalQuestion> _journalQuestions;
//   @override
//   void initState() {
//     super.initState();
//     _journalQuestions = journalQuestions[widget.notifier.name]
//             ?.map((e) => JournalQuestion(e))
//             .toList() ??
//         [];
//   }

//   @override
//   Widget build(BuildContext context) {
//     var questionText = const Padding(
//         padding: EdgeInsets.fromLTRB(10, 20.0, 10, 0),
//         child: Text("Note",
//             // "Example question: Are you a good friend to yourself?", //"<journal question>"
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)));

//     Scaffold journalScaffold() {
//       var questionStrings = _journalQuestions.map((j) => j.question).toList();
//       print(questionStrings);
//       print(_journalQuestions);
//       var controller = TextEditingController();
//       void save() {
//         if (controller.text.isNotEmpty) {
//           widget.notifier.insertJournalEntry(JournalEntryData(
//               controller.text.toString(),
//               type: EntryType.note));
//         }
//       }

//       return Scaffold(
//           backgroundColor: const Color(0xFFFFFFFF),
//           bottomNavigationBar: BottomAppBar(
//             height: 100,
//             padding: const EdgeInsets.all(0.0),
//             child: Container(
//               color: Colors.amber,
//               child: InkWell(
//                 onTap: () {
//                   save();
//                   Navigator.pop(context);
//                 },
//                 child: const Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.local_florist,
//                       size: 30,
//                     ),
//                     Text(
//                       "Finish new journal entry",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           appBar: AppBar(
//             backgroundColor:
//                 Colors.lightBlue, //Theme.of(context).colorScheme.primary,
//             toolbarHeight: 70,
//             centerTitle: true,

//             title: const Center(
//               child: Text(
//                 "New journal entry",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           body: Column(
//             children: <Widget>[
//               //navButtons,
//               questionText,
//               DropdownButtonExample(list: questionStrings),
//               const SizedBox(height: 10),
//               Card(
//                   color: Colors.lightBlue[50],
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: TextFormField(
//                       controller: controller,
//                       onEditingComplete: save,
//                       autofocus: true,
//                       maxLines: 15, //or null
//                       decoration: const InputDecoration.collapsed(
//                           hintText: "Enter your text here", filled: false),
//                     ),
//                   )),
//             ],
//           ));
//     }

//     return journalScaffold();
//   }
// }

// class JournalQuestion {
//   JournalQuestion(this.question, {this.selected = false});

//   String question;
//   bool selected;
// }

// class DropdownButtonExample extends StatefulWidget {
//   const DropdownButtonExample({required this.list, super.key});

//   final List<String> list;
//   @override
//   State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
// }

// class _DropdownButtonExampleState extends State<DropdownButtonExample> {
//   String dropdownValue = "Select a reflection question.";

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.blue),
//       underline: Container(
//         height: 2,
//         color: Colors.blue,
//       ),
//       onChanged: (String? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: widget.list.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }
