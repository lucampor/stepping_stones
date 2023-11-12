import 'package:flutter/material.dart';

enum EntryType {
  note,
  reflection
}

class JournalEntry extends StatefulWidget {
  const JournalEntry(
    this.name,
    {
      this.content,
      this.question,
      required this.type,
      super.key,
  });

  final String name;
  final EntryType type;
  final String? content;
  final String? question;

  @override
  State<JournalEntry> createState() => _ObjectiveState();
}

class _ObjectiveState extends State<JournalEntry> {
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
      onTap: () => showDialog(
        context: context,
        builder: (BuildContext context) => entryInfo(),
      ),

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
