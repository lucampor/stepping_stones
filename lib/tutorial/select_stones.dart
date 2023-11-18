import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter/material.dart';

class SelectGoal extends StatefulWidget {
  bool isSelected = false;

  @override
  State<SelectStones> createState() => _SelectStonesState();
}


class _SelectStonesState extends State<SelectStones> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

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
        onPressed: (){print("test");},
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
        onPressed: (){print("test");},
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
              padding: const EdgeInsets.fromLTRB(0, 64, 0, 32),
              child: const Center(child: Text(
        "Select some stepping stones for improving self-talk",
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
    )));

    var progressBar = Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: StepProgressIndicator(
        totalSteps: 3,
        currentStep: 1,
        size: 15,
        selectedColor: Colors.green,
        unselectedColor: Colors.black38,
    ));

    var progressAndProceed = Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 32),
              child: Row(
      children: <Widget>[
          backButton,
          Expanded(child: progressBar),
          skipButton,
      ]
    ));
    
    return 
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
            // subtitle: Text('Membuat pembayaran untuk diri sendiri'),
            trailing: _isSelected ? const Icon(Icons.check_circle) : const Icon(Icons.circle),
          )),
        )),
        Material(
          child: InkWell(
          onTap: () {
            setState(() {
              _isSelected = false;
            });
          },
          child: Card(
            child: ListTile(
              title: Text('Working on my self-talk', style: TextStyle(fontWeight: FontWeight.bold)),
              // subtitle: Text('Membuat pembayaran untuk organisasi'),
              trailing: !_isSelected ? const Icon(Icons.check_circle) : const Icon(Icons.circle),
            ),
          ),
        ))]),
        progressAndProceed
      ],
    )
    );
  }
}