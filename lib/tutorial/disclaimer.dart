// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:stepping_stones/objectives/data.dart';
import 'package:stepping_stones/main_screen/page.dart';

class Disclaimer extends StatefulWidget {
  const Disclaimer(this.goal, {super.key});

  final ObjectiveData goal;

  @override
  State<Disclaimer> createState() => _DisclaimerState();
}

class _DisclaimerState extends State<Disclaimer> {
  bool understood = false;
  @override
  Widget build(BuildContext context) {
    var disclaimerString =
        "Stepping Stones was created with the purpose of guiding and helping you to find and create your own path towards a better self. \n \nHowever, we are not professional therapists. \n \nIf you are struggling with a severe mental health issue, please seek professional assistance.";

    var disclaimerText = Text(disclaimerString,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.black,
      )
    );

    var headingText = const Text("WE CARE ABOUT\nYOUR MENTAL HEALTH",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        color: Colors.black,
        overflow: TextOverflow.clip
      )
    );

    var progressBar = const Padding(
        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: StepProgressIndicator(
          totalSteps: 3,
          currentStep: 3,
          size: 15,
          selectedColor: Colors.lightBlue,
          unselectedColor: Colors.black38,
        ));

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

    var finishButton = SizedBox(
        width: 140,
        height: 40,
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GoalPage([widget.goal])));
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

    var understand = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: understood,
          onChanged: (b) {setState(() {
                understood = b ??= false;
              }
            );
          }
        ),
        InkWell(
          onTap: () { setState(() {
            understood = !understood;
          }); },
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Text("I understand",
            style: TextStyle(fontSize: 24),),
        )
      ],
    );

    var navButtons = Row(children: <Widget>[
      backButton,
      const Spacer(),
      if (understood)
        finishButton,
    ]);

    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          toolbarHeight: 140,
          title: headingText,
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        bottomNavigationBar: progressBar,
        body: SafeArea(
          minimum: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(child: disclaimerText),
              understand,
              Divider(height: 30, color: Colors.transparent,),
              navButtons
            ],
          ),
        ),
    );
  }
}
