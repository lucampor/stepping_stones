import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter/material.dart';
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
  "Create a personalized mindfulness routine for daily practice.",
  "Practice daily affirmations for a week.",
  ],

  "Strengthen Self-Expression": [
  "Write a letter expressing your feelings to someone.",
  "Participate in a creative expression activity.",
  "Share an opinion or idea in a group setting.",
  "Join a club related to your interests.",
  ],

  "Deepen Existing Relationships": [
  "Schedule dedicated quality time with friends or loved ones.",
  "Open up about deeper aspects of your life to someone you trust.",
  "Express appreciation to someone in your life",
  "Identify shared goals with friends or significant others.",
  "Make a plan to work towards them together",
  ],

  "Find Romance": [
  "Make a list of qualities and characteristics you want in a romantic partner.",
  "Reflect on past romantic experiences.",
  "Identify relationship goals.",
  "Challenge the fear of rejection and introduce yourself to someone you feel attracted to.",
  "Create an online dating profile that represents your true self.",
  "Make a customized plan of coping strategies to navigate rejection and romantic mishaps.",
  ],
};

class Stone {
  Stone(this.name): selected = false;
  final String name;
  bool selected;
}

class SelectStones extends StatefulWidget {
  const SelectStones(this.goals, {super.key});
  final List<String> goals;

  @override
  State<SelectStones> createState() => _SelectStonesState();
}

class _SelectStonesState extends State<SelectStones> {
  @override
  Widget build(BuildContext context) {
    return GoalStones(widget.goals[0]);
  }
}

class GoalStones extends StatefulWidget {
  GoalStones(this.goal, {super.key}): stones = steppingStones[goal]?.map((e)=>Stone(e)).toList() ?? <Stone>[];
  final String goal;
  //final (int, int) remaining;
  final List<Stone> stones;
  @override
  State<GoalStones> createState() => _GoalStonesState();
}

class _GoalStonesState extends State<GoalStones> {
  @override
  Widget build(BuildContext context) {
    var descriptiveText = const Padding(
        padding: EdgeInsets.fromLTRB(0, 32, 0, 20),
        child: Column(children: <Widget>[
          Center(
              child: Text("Select some stepping stones for",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ))),
          Center(
              child: Text("working on my self-talk:",
                  style: TextStyle(
                    fontSize: 18,
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


    var nextButton = widget.stones.where((s) => s.selected).isNotEmpty ? const NavButton(NavType.next) : const NavButton(NavType.skip);
    var navButtons = Row(children: <Widget>[
      const NavButton(NavType.back),
      const Spacer(),
      nextButton,
    ]);

    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body:SafeArea(
            minimum: const EdgeInsets.all(10),
            child: ListView.separated(
              itemCount: widget.stones.length,
              itemBuilder: (context, index) {
                var elems =
                  [
                    Expanded(
                    child: InkWell(
                      onTap: ()=> setState((){widget.stones[index].selected = !widget.stones[index].selected;}),
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
                          child: Text(widget.stones[index].name),
                        ),
                      ),
                    ),
                  ),
                  const VerticalDivider(width: 30,),
                ];

                if (widget.stones[index].selected) {
                  elems = elems.reversed.toList();
                }

                return Row(children: elems);
              },
              separatorBuilder: (context, index) => const Divider(
                height: 10,
                color: Colors.transparent,
              ),
            )
          )
    );
  }
}

enum NavType {
  back,
  next,
  skip
}

class NavButton extends StatelessWidget {
  const NavButton(this.type,
    {
    super.key,
  });

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

// individual stepping stone item
class SteppingStoneItem extends StatefulWidget {
  const SteppingStoneItem(this.type, this.steppingStoneText, {super.key});
  final String steppingStoneText;
  final String type;

  @override
  // ignore: library_private_types_in_public_api
  _SteppingStoneItemState createState() => _SteppingStoneItemState();
}

class _SteppingStoneItemState extends State<SteppingStoneItem> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    var checkbox = Checkbox(
      value: value,
      onChanged: (bool? value) {
        if (value != null) {
          setState(() {
            this.value = value;
          });
        }
      },
    );

    if (widget.type == "center") {
      return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /** Checkbox Widget **/
              checkbox, //Checkbox
              const SizedBox(width: 10), //SizedBox
              Flexible(
                  child: Text(
                widget.steppingStoneText,
                style: const TextStyle(fontSize: 16),
              )), //Text
            ], //<Widget>[]
          )); //Row
    } else {
      return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /** Checkbox Widget **/
              checkbox, //Checkbox
              const SizedBox(width: 10), //SizedBox
              Flexible(
                  child: Text(
                widget.steppingStoneText,
                style: const TextStyle(fontSize: 16),
              )), //Text
            ], //<Widget>[]
          )); //Row
    }
  }
}
