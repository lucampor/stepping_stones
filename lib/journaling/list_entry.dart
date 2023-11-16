import 'package:flutter/material.dart';
import 'package:stepping_stones/journaling/data.dart';

class JournalEntry extends StatelessWidget {
  const JournalEntry(this.data, {super.key});

  final JournalEntryData data;


  Dialog entryInfo() => Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppBar(
          title: Text(data.name),
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
                  data.name,
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
