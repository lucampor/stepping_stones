import 'package:flutter/material.dart';
import 'package:stepping_stones/objectives/model.dart';
import 'package:stepping_stones/stones/list_entry.dart';

class SteppingStoneList extends StatelessWidget {
  const SteppingStoneList(this.objectiveNotifier,{super.key, });

  final ObjectiveModel objectiveNotifier;

  @override
  Widget build(BuildContext context) {

    return ListenableBuilder(
      listenable: objectiveNotifier,
      builder: (context, snapshot) {
        final tasks = objectiveNotifier.stones;
        return ListView.separated(
          separatorBuilder: (context, index) {
            const sep = 14;
            const initial = 7.0;
            var icons = [
                const Icon(Icons.circle, size: 10,),
                const Icon(Icons.circle, size: 10,),
                const Icon(Icons.circle, size: 10,),
                const Icon(Icons.circle, size: 10,),
              ].asMap().map((i, e) => MapEntry(i,
                Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: i.isEven ? sep+initial : initial),
                    child: e),
              )).values.toList();

            if (index.isEven) {
              icons = icons.reversed.toList();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: icons,
            );
          },

          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return SteppingStoneEntry(tasks.reversed.elementAt(index));
          },
          padding: const EdgeInsets.only(bottom: 40),
        );
      }
    );
  }
}
