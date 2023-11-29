import 'package:flutter/material.dart';
import 'package:stepping_stones/journaling/data.dart';

class JournalEntry extends StatelessWidget {
  const JournalEntry(this.data, {super.key});

  final JournalEntryData data;

  @override
  Widget build(BuildContext context) {
    var questionText = (data.question != null)
        ? Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(data.question.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )))
        : const SizedBox(height: 4);

    Dialog entryInfo() => Dialog(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // AppBar(
                      //   title: Text(data.name),
                      //   centerTitle: true,
                      // )
                      Text(data.type.name.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      questionText,
                      SizedBox(
                          width: double.infinity,
                          child: Text(data.name,
                              style: const TextStyle(fontSize: 16))),
                    ],
                  ))),
        );

    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (BuildContext context) => entryInfo(),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  width: 8)),
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(data.type.name.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  data.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
        ),
      ),
    );
  }
}
