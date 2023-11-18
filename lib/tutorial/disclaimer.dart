import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

// const header = "We value your privacy";

class Disclaimer extends StatelessWidget {
  const Disclaimer({super.key});

  @override
  Widget build(BuildContext context) {
    return
    
    var disclaimerText = const Center(child: Text(
        "Stepping Stones was created with the purpose of guiding and helping you to find and create your own path towards a better self.
        However, we are not professional therapists. If you are struggling with a severe mental health issue, please seek professional assistance.",
        style: TextStyle(
          fontSize: 18
        ),
    ));
    
    StepProgressIndicator(
    totalSteps: 3,
    currentStep: 3,
    selectedColor: Colors.green,
    unselectedColor: Colors.gray,
  );
  }
}
