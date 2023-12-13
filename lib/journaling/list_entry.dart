import 'package:flutter/material.dart';
import 'package:stepping_stones/journaling/data.dart';
import 'package:stepping_stones/journaling/model.dart';
import 'package:stepping_stones/journaling/page.dart';
import 'package:stepping_stones/objectives/model.dart';

class JournalEntry extends StatelessWidget {
  const JournalEntry(this.data, {required this.parent, super.key});

  final ObjectiveModel parent;
  final JournalEntryData data;

  @override
  Widget build(BuildContext context) {
    
    var questionText = (data.question != null) ? 
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Text(
        data.question.toString(), 
        style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ))) 
      : const SizedBox(height: 4);

    Dialog entryInfo() => Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue[50], 
            borderRadius: const BorderRadius.all(Radius.circular(20))
          ),
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
        Text(data.type.name.toUpperCase(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        questionText,
        Container(
          width: double.infinity, child: Text(data.name, style: const TextStyle(fontSize: 16))),
      ],
    ))
    ),
  );
    
    return InkWell(
      onTap: () => Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => JournalPage(
            JournalModel(data, parent: parent),
            newEntry: false,
          )
        )
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.lightBlue,
            ),
            child: Text(data.type.name.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ),

          if (data.question != null)
            Text(data.question ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black45
              ),
            ),

          Text(data.content ?? "",
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
