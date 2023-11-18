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
    var appBar = AppBar(
        backgroundColor: Color(0xFFFFFFFF),//Theme.of(context).colorScheme.primary,
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

    var nextButton = SizedBox(
      width: 90,
      height: 40,
      child: OutlinedButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectStones()));
        },
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

    var descriptiveText = 
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 32, 0, 20),
        child: const Center(child: Text(
        "What goal would you like to work on?",
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
    )));

    var progressBar = Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
      child: StepProgressIndicator(
        totalSteps: 3,
        currentStep: 1,
        size: 15,
        selectedColor: Colors.green,
        unselectedColor: Colors.black38,
    ));

    var progressAndProceed = Row(
      children: <Widget>[
          Expanded(child: progressBar),
          nextButton,
      ]
    );
    
    return 
    Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body:
    Padding(
      padding: const EdgeInsets.fromLTRB(12, 32, 12, 32),
    child: 
    Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Column(
          children: <Widget>[
        descriptiveText,
         Material(
          child: InkWell(
          onTap: () {
            setState(() {
              _isSelected = false;
            });
          },
          child: Card(
              child: ListTile(
            title: Text(
              'Improving confidence',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: !_isSelected ? const Icon(Icons.check_circle) : const Icon(Icons.circle),
          )),
        )),
        Material(
          child: InkWell(
          onTap: () {
            setState(() {
              _isSelected = true;
            });
          },
          child: Card(
            child: ListTile(
              title: Text('Working on my self-talk', style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: _isSelected ? const Icon(Icons.check_circle) : const Icon(Icons.circle),
            ),
          ),
        ))]),
        progressAndProceed
      ],
    )
    )));
  }
}