import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:stepping_stones/objectives/data.dart';
import 'package:stepping_stones/stones/data.dart';
import 'package:stepping_stones/stones/list_entry.dart';
import 'package:stepping_stones/stones/status.dart';
import 'package:stepping_stones/tutorial/disclaimer.dart';

const steppingStones = {
  "Create a Positive Mindset": [
  "Start a gratitude journal and record three things daily.",
  "Find a meditation video online and try it out",
  "Identify positive influences in your life, and spend time with one of them.",
  "Celebrate a  small victory or achievement.",
  "Do a social media cleanse to limit exposure to negative media.",
  ],

  "Improve Social Skills": [
  "Challenge yourself to maintain eye contact for gradually increasing durations.",
  "Practice introducing yourself with confidence in social settings.",
  "Engage in small talk with a stranger safely",
  "Request constructive feedback from friends or mentors on your social interactions",
  ],

  "Reduce Rejection Sensitivity": [
  "Gradually expose yourself to slightly uncomfortable social scenarios",
  "Reflect on root causes of rejection sensitivity.",
  "Create a mindfulness routine for daily practice.",
  "Practice daily affirmations for a week.",
  ],

  "Strengthen Self-Expression": [
  "Write a letter expressing your feelings to someone.",
  "Participate in a creative expression activity.",
  "Share an opinion or idea in a group setting.",
  "Join a club related to your interests.",
  ],

  "Deepen Existing Relationships": [
  "Schedule quality time for friends or loved ones.",
  "Talk about deeper aspects of your life to someone you trust.",
  "Express appreciation to someone in your life",
  "Identify shared goals with friends.",
  "Make a plan to work towards them together",
  ],

  "Find Romance": [
  "List the qualities you want in a romantic partner.",
  "Reflect on past romantic experiences.",
  "Identify relationship goals.",
  "Introduce yourself to someone you feel attracted to.",
  "Create an online dating profile of your true self.",
  "Develop coping strategies against romantic mishaps.",
  ],
};

// class SelectStones extends ChangeNotifier {
//   SelectStones(this._goals);
//   final List<String> _goals;
//   int _current = 0;

//   String? get current => _goals[_current];
//   int get remaining => _goals.length - _current;

//   void next() {
//     _current++;
//     notifyListeners();
//   }

//   void prev() {
//     _current--;
//     notifyListeners();
//   }

// }

class GoalStones extends StatefulWidget {
  GoalStones(this.goal, {super.key});
  final String goal;
  //final (int, int) remaining;
  @override
  State<GoalStones> createState() => _GoalStonesState();
}

class _GoalStonesState extends State<GoalStones> {
  late List<Stone> _stones;
  @override
  void initState() {
    super.initState();
   _stones = steppingStones[widget.goal]
   ?.map((e)=>
     Stone(e)
   ).toList()
   ?? [];
  }

  @override
  Widget build(BuildContext context) {
    var descriptiveText = Padding(
        padding: const EdgeInsets.fromLTRB(0, 32, 0, 20),
        child: Column(children: <Widget>[
          const Center(
              child: Text("Select some stepping stones for",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ))),
          Center(
              child: Text(widget.goal,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )))
        ]));

    var progressBar = const Padding(
        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: StepProgressIndicator(
          totalSteps: 3,
          currentStep: 2,
          size: 15,
          selectedColor: Colors.lightBlue,
          unselectedColor: Colors.black38,
        ));


    var disclaimer = Disclaimer(ObjectiveData(widget.goal, steppingStones: _stones.where((e) => e.selected).map((e) => SteppingStoneData(e.name)).toList()));
    var nextButton = _stones.where((s) => s.selected).isNotEmpty ? NavButton.next(NavType.next, next: disclaimer,) : NavButton.next(NavType.skip, next: disclaimer);
    var navButtons = Row(children: <Widget>[
      const NavButton.back(NavType.back),
      const Spacer(),
      nextButton,
    ]);

    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body:SafeArea(
            minimum: const EdgeInsets.all(10),
            child: Column(
              children: [
                descriptiveText,
                Expanded(
                  child: ListView.separated(
                    itemCount: _stones.length,
                    itemBuilder: (context, index) {
                      var elems = [
                          Expanded(
                          child: InkWell(
                            child: StoneRect(_stones[index].name,
                              status: _stones[index].selected ? StoneStatus.ongoing : StoneStatus.dropped,
                              overflow: TextOverflow.clip,
                              omitStatus: true),
                            onTap: () {setState(() {
                              _stones[index].selected = !_stones[index].selected;
                            });},
                          ),
                        ),
                        const VerticalDivider(width: 30,),
                      ];

                      if (_stones[index].selected) {
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
                navButtons,
              ],
            )
        ),
        bottomNavigationBar: progressBar,
    );
  }
}

enum NavType {
  back,
  next,
  skip
}

class NavButton extends StatelessWidget {
  const NavButton.next(this.type,
    {
    required this.next,
    super.key,
  });

  const NavButton.back(this.type,
    {
    this.next = const Row(),
    super.key,
  });

  final Widget next;
  final NavType type;


  @override
  Widget build(BuildContext context) {
    String val = switch (type) {
      NavType.back => "Back",
      NavType.next => "Next",
      NavType.skip => "Skip",
    };

    return SizedBox(
        width: 90,
        height: 40,
        child: OutlinedButton(
            onPressed: () {
                if (type == NavType.back) {
                  Navigator.pop(context);
                } else {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => next)
                  );
                }
            },
            child: Center(
              child: Text(
                val,
                style: const TextStyle(
                  fontSize: 16,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            )));
  }
}


class Stone {
  Stone(this.name, {this.selected = false});

  String name;
  bool selected;
}
