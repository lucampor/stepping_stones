import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:stepping_stones/tutorial/select_stones.dart';

class SelectGoal extends StatefulWidget {
  const SelectGoal(this.isSelected, {super.key});
  final bool isSelected;

  @override
  State<SelectGoal> createState() => _SelectGoalState();
}

class _SelectGoalState extends State<SelectGoal> {
  late bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    var nextButton = SizedBox(
        width: 90,
        height: 40,
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SelectStones()));
            },
            child: const Center(
              child: Text(
                "Next",
                style: TextStyle(
                  fontSize: 16,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            )));

    var welcomeText = const Padding(
        padding: EdgeInsets.fromLTRB(0, 12, 0, 20),
        child: Center(
            child: Text(
          "Welcome to Stepping Stones!",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Colors.black,
          ),
        )));

    var descriptiveText = const Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Center(
            child: Text(
          "What goal would you like to work on?",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        )));

    var progressBar = const Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
        child: StepProgressIndicator(
          totalSteps: 3,
          currentStep: 1,
          size: 15,
          selectedColor: Colors.lightBlue,
          unselectedColor: Colors.black38,
        ));

    var navButtons = Row(children: <Widget>[
      Container(color: Colors.white, width: 90, height: 40),
      const Spacer(),
      nextButton,
    ]);

    int selectedOption = 0;

    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(12, 32, 12, 32),
            child: Scaffold(
                backgroundColor: const Color(0xFFFFFFFF),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(children: <Widget>[
                      welcomeText,
                      descriptiveText,
                      Card(
                          color: Colors.lightBlue[50],
                          child: InkWell(
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  _isSelected = false;
                                });
                              },
                              child: ListTile(
                                title: const Text(
                                  "Improving confidence",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                trailing: !_isSelected
                                    ? const Icon(Icons.check_circle)
                                    : const Icon(Icons.circle),
                              ))),
                      Card(
                          color: Colors.lightBlue[50],
                          child: InkWell(
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  _isSelected = true;
                                });
                              },
                              child: ListTile(
                                title: const Text(
                                  "Working on my self-talk",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                trailing: _isSelected
                                    ? const Icon(Icons.check_circle)
                                    : const Icon(Icons.circle),
                              ))),
                    ]),
                    Column(children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                          child: navButtons),
                      progressBar
                    ])
                  ],
                ))));
  }
}

// class GoalItem extends StatefulWidget {
//   const GoalItem(this.goalText, this.state, {super.key});
//   final String goalText;
//   final bool state;

//   @override
//   State<GoalItem> createState() => _GoalItemState();
// }

// class _GoalItemState extends State<GoalItem> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//         color: Colors.lightBlue[50],
//         child: InkWell(
//             hoverColor: Colors.transparent,
//             splashColor: Colors.transparent,
//             onTap: () {
//               setState(() {
//                 !widget.state;
//               });
//             },
//             child: ListTile(
//               title: Text(
//                 widget.goalText,
//                 style:
//                     const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//               ),
//               trailing: !widget.state
//                   ? const Icon(Icons.check_circle)
//                   : const Icon(Icons.circle),
//             )));
//   }
// }
