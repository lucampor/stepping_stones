import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:stepping_stones/tutorial/disclaimer.dart';

class SelectStones extends StatefulWidget {
  const SelectStones({super.key});

  @override
  State<SelectStones> createState() => _SelectStonesState();
}

class _SelectStonesState extends State<SelectStones> {
  @override
  Widget build(BuildContext context) {
    var skipButton = SizedBox(
        width: 90,
        height: 40,
        child: OutlinedButton(
            onPressed: () {
              print("test");
            },
            child: const Center(
              child: Text(
                "Skip",
                style: TextStyle(
                  fontSize: 16,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            )));

    var nextButton = SizedBox(
        width: 90,
        height: 40,
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Disclaimer()));
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
                "Back",
                style: TextStyle(
                  fontSize: 16,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            )));

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

    var navButtons = Row(children: <Widget>[
      backButton,
      const Spacer(),
      nextButton,
    ]);

    var steppingStones = Column(children: <Widget>[
      descriptiveText,
      const SteppingStoneItem("start",
          "Start your day by saying positive affirmations in the mirror"),
      const SteppingStoneItem("start",
          "Challenge your inner critic — provide counterarguments for your negative thoughts"),
      const SteppingStoneItem("start",
          "Find examples of traits you want that can already be found in you"),
      const SteppingStoneItem(
          "start", "Complete a social media — unfollow accounts that harm you"),
      const SteppingStoneItem(
          "start", "Go a whole day saying \"I can't\" or \"I should do\""),
      const SteppingStoneItem(
          "start", "Outline the characteristics you wish to have"),
    ]);

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
                    steppingStones,
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
