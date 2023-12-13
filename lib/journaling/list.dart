
import 'package:flutter/material.dart';
import 'package:stepping_stones/journaling/list_entry.dart';
import 'package:stepping_stones/objectives/model.dart';

class JournalList extends StatelessWidget {
  const JournalList(this.objectiveNotifier, {super.key, });

  final ObjectiveModel objectiveNotifier;

  @override
  Widget build(BuildContext context) {

    return ListenableBuilder(
      listenable: objectiveNotifier,
      builder: (context, snapshot) {
        final entries = objectiveNotifier.journal;
        return ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider(
              height: 20, color: Colors.white,
            );
          },
          itemCount: entries.length,
          itemBuilder: (context, index) {
            return JournalEntry(entries[index], parent: objectiveNotifier,);
          }
        );
      }
    );
  }
}
