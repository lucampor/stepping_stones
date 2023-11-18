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
    var appBar = AppBar(
        backgroundColor: Colors.lightBlue,//Theme.of(context).colorScheme.primary,
        toolbarHeight: 70,
        centerTitle: true,

        title: const Center(
          child: Text(
            "My goals",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
    );

    var skipButton = SizedBox(
      width: 90,
      height: 40,
      child: OutlinedButton(
        onPressed: (){print("test");},
        child: const Center(
          child: Text("Skip",
            style: TextStyle(
              fontSize: 16,
            ),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        )
    ));

    var nextButton = SizedBox(
      width: 90,
      height: 40,
      child: OutlinedButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Disclaimer()));},
        child: const Center(
          child: Text("Next",
            style: TextStyle(
              fontSize: 16,
            ),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        )
    ));

    var backButton = SizedBox(
      width: 90,
      height: 40,
      child: OutlinedButton(
        onPressed: (){Navigator.pop(context);},
        child: const Center(
          child: Text("Back",
            style: TextStyle(
              fontSize: 16,
            ),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        )
    ));

    var descriptiveText = 
      Padding(
          padding: const EdgeInsets.fromLTRB(0, 32, 0, 20),
          child: Column(
            children: <Widget>[
            Center(child: Text(
            "Select some stepping stones for",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ))),
            Center(child: Text(
            "improving self-talk",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            )))]
          )
    );

    var progressBar = Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: StepProgressIndicator(
        totalSteps: 3,
        currentStep: 2,
        size: 15,
        selectedColor: Colors.green,
        unselectedColor: Colors.black38,
    ));

    var progressAndProceed = Row(
      children: <Widget>[
          backButton,
          Expanded(child: progressBar),
          nextButton,
      ]
    );

    var steppingStones = Column(
      children: <Widget>[
        descriptiveText,
        SteppingStoneItem("Start your day by saying positive affirmations in the mirror"),
        SteppingStoneItem("Challenge your inner critic — provide counterarguments for your negative thoughts"),
        SteppingStoneItem("Find examples of traits you want that can already be found in you"),
        SteppingStoneItem("Complete a social media — unfollow accounts that harm you"),
        SteppingStoneItem("Go a whole day saying \"I can't\" or \"I should do\""),
        SteppingStoneItem("Outline the characteristics you wish to have"),
    ]);
    
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body:
    Padding(
      padding: const EdgeInsets.fromLTRB(12, 32, 12, 32),
    child: Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        steppingStones,
        progressAndProceed
      ],
    )
    )));
  }
}

// individual stepping stone item
class SteppingStoneItem extends StatefulWidget {
  const SteppingStoneItem(this.steppingStoneText, {super.key});
  final String steppingStoneText;

  @override
  _SteppingStoneItemState createState() => _SteppingStoneItemState();
}
 
class _SteppingStoneItemState extends State<SteppingStoneItem> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      /** Checkbox Widget **/
      Checkbox(
        value: this.value,
        onChanged: (bool? value) {
          if (value != null) {
          setState(() {
            this.value = value;
          });
          }
        },
      ), //Checkbox
      SizedBox(width: 10), //SizedBox
      Flexible (child: Text(
            widget.steppingStoneText,
            style: TextStyle(fontSize: 16),
          )), //Text
    ], //<Widget>[]
  )); //Row
  }
}