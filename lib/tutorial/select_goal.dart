import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:stepping_stones/tutorial/select_stones.dart';

class SelectGoal extends StatefulWidget {
  const SelectGoal({super.key});

  @override
  State<SelectGoal> createState() => _SelectGoalState();
}

class _SelectGoalState extends State<SelectGoal> {
  final goals = [
    // "Improve confidence",
    // "Improve self-talk",
    "Create a Positive Mindset",
    "Improve Social Skills",
    "Reduce Rejection Sensitivity",
    "Strengthen Self-Expression",
    "Deepen Existing Relationships",
    "Find Romance"
  ].map((g) => Goal(g)).toList();
  String? selected;
  int prev = 0;

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
                      builder: (context) => GoalStones(selected ?? "")));//goals.where((g) => g.selected).map((e) => e.name).toList())));
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

    var welcomeText = Text("Welcome to Stepping Stones!",
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: Colors.black,
      ),
    );

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

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: welcomeText,
        centerTitle: true,
      ),
      body:
          SafeArea(
            minimum: const EdgeInsets.all(10),
            child: Column(
              children: [
                descriptiveText,
                Expanded(
                  child: ListView.separated(
                    itemCount: goals.length,
                    itemBuilder: (context, index) {
                      var elems =
                        [
                          Expanded(
                          child: InkWell(
                            onTap: ()=> setState((){
                                selected = goals[index].name;
                                goals[index].selected = true;
                                if (prev != index) {
                                  goals[prev].selected = false;
                                }
                                prev = index;
                            }),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                decoration: BoxDecoration(border: Border.all(
                                    color: Theme.of(context).colorScheme.inversePrimary,
                                    width: 8
                                )),
                                padding: const EdgeInsetsDirectional.symmetric(
                                  horizontal: 10,
                                  vertical: 20
                                ),
                                child: Text(goals[index].name),
                              ),
                            ),
                          ),
                        ),
                        const VerticalDivider(width: 30,),
                      ];

                      if (goals[index].selected) {
                        elems = elems.reversed.toList();
                      }

                      return Row(children: elems);
                    },
                    separatorBuilder: (context, index) => const Divider(
                      height: 10,
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    if (selected != null)//goals.where((g) => g.selected).toList().isNotEmpty)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: nextButton,
                    )
                  ],
                )
              ],
            )
          ),
      bottomNavigationBar: progressBar,
    );
  }
}

class Goal {
  Goal(this.name, {this.selected = false});

  String name;
  bool selected;
}

// class GoalItem extends StatefulWidget {
//   const GoalItem(this.goal, {super.key});
//   final Goal goal;

//   @override
//   State<GoalItem> createState() => _GoalItemState();
// }

// class _GoalItemState extends State<GoalItem> {
//   @override
//   Widget build(BuildContext context) {
//     var elem = [
//       Expanded(
//         child: InkWell(
//           onTap: ()=> setState((){widget.goal.selected = !widget.goal.selected;}),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: Container(
//               decoration: BoxDecoration(border: Border.all(
//                   color: Theme.of(context).colorScheme.inversePrimary,
//                   width: 8
//               )),
//               padding: const EdgeInsetsDirectional.symmetric(
//                 horizontal: 10,
//                 vertical: 20
//               ),
//               child: Text(widget.goal.name),
//             ),
//           ),
//         ),
//       ),
//       const VerticalDivider(width: 30,),
//     ];
//     if (widget.goal.selected) {
//       elem = elem.reversed.toList();
//     }

//     return Row(
//       children: elem,
//     );
    // Card(
    //     color: Colors.lightBlue[50],
    //     child: InkWell(
    //         hoverColor: Colors.transparent,
    //         splashColor: Colors.transparent,
    //         onTap: () {
    //           setState(() {
    //             !widget.state;
    //           });
    //         },
    //         child: ListTile(
    //           title: Text(
    //             widget.goal,
    //             style:
    //                 const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    //           ),
    //           trailing: !widget.state
    //               ? const Icon(Icons.check_circle)
    //               : const Icon(Icons.circle),
    //        )));
//   }
// }
