import 'package:flutter/material.dart';
import 'package:stepping_stones/goal_tracking/path.dart';
import 'package:stepping_stones/journaling/journal_page.dart';

enum CurrentPage {
  journal,
  stepping
}

class Objective extends StatefulWidget {
  const Objective(
    this.name,
    {
      super.key,
  });

  final String name;

  @override
  State<Objective> createState() => _ObjectiveState();
}

class _ObjectiveState extends State<Objective> {
  CurrentPage __current = CurrentPage.stepping;

  Dialog entryInfo() => Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppBar(
          title: Text(widget.name),
          centerTitle: true,
        )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
            switch (__current) {
              CurrentPage.journal => JournalPage(widget.name),
              CurrentPage.stepping => SteppingStonePage(widget.name)
              }
          )
        )
      },

      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(border: Border.all(
              color: Theme.of(context).colorScheme.inversePrimary,
              width: 8
          )),
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 50,
            vertical: 30
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded
              )
            ],
          ),
        ),
      ),
    );
  }
}
