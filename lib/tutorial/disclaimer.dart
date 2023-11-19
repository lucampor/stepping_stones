import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:stepping_stones/tutorial/select_stones.dart';
import 'package:stepping_stones/main_screen/page.dart';

class Disclaimer extends StatelessWidget {
  const Disclaimer({super.key});

  @override
  Widget build(BuildContext context) {
    var disclaimerString =
        "Stepping Stones was created with the purpose of guiding and helping you to find and create your own path towards a better self. \n \nHowever, we are not professional therapists. \n \nIf you are struggling with a severe mental health issue, please seek professional assistance.";

    var disclaimerText = Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Center(
            child: Text(disclaimerString,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ))));

    var headingText = const Padding(
        padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
        child: Center(
            child: Text("WE CARE ABOUT YOUR MENTAL HEALTH",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ))));

    var progressBar = const Padding(
        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: StepProgressIndicator(
          totalSteps: 3,
          currentStep: 3,
          size: 15,
          selectedColor: Colors.green,
          unselectedColor: Colors.black38,
        ));

    var backButton = SizedBox(
        width: 90,
        height: 40,
        child: OutlinedButton(
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

    var finishButton = SizedBox(
        width: 140,
        height: 40,
        child: OutlinedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const GoalPage()));
            },
            child: const Center(
              child: Text(
                "Let's Begin!",
                style: TextStyle(
                  fontSize: 16,
                ),
                softWrap: false,
                textAlign: TextAlign.center,
              ),
            )));

    var progressAndProceed = Row(children: <Widget>[
      backButton,
      Expanded(child: progressBar),
      finishButton,
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
                    Column(children: <Widget>[
                      headingText,
                      disclaimerText,
                    ]),
                    const SteppingStoneItem("I understand"),
                    progressAndProceed
                  ],
                ))));
  }
}
