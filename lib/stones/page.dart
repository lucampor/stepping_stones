import 'package:flutter/material.dart';
import 'package:stepping_stones/objectives/model.dart';

class SteppingStonePage extends StatefulWidget {
  const SteppingStonePage(this.notifier, {super.key});

  final ObjectiveModel notifier;

  @override
  State<SteppingStonePage> createState() => _SteppingStonePageState();
}

class _SteppingStonePageState extends State<SteppingStonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
