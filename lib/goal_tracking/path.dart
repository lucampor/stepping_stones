import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stepping_stones/goal_tracking/stone.dart';

class SteppingStonePage extends StatefulWidget {
  const SteppingStonePage(
    this.goal, {
    super.key,
  });

  final String goal;


  @override
  State<SteppingStonePage> createState() => _SteppingStonePageState();
}

class _SteppingStonePageState extends State<SteppingStonePage> {
  @override
  Widget build(BuildContext context) {
var steppingBar = AppBar(
  automaticallyImplyLeading: false,
          toolbarHeight: 100,
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          // actions: const [
          //   Icon(Icons.filter_alt_rounded, size: 60, color: Colors.black,)
          // ],

          title: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Stepping Stones of:\n",
                children: [TextSpan(
                    text: widget.goal,
                    style: const TextStyle(fontWeight: FontWeight.bold)
                )],
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black
                ),
              )
            ),
        );

    var tasks = [
      const SteppingStone("Try to have a conversation with someone"),
      const SteppingStone("Wear a bright color", status: StoneStatus.dropped,),
      const SteppingStone("Workout", status: StoneStatus.completed),
      const SteppingStone("Wear a bright color"),
      const SteppingStone("Workout"),
      const SteppingStone("Try to have a conversation with someone"),
      const SteppingStone("Workout"),
      const SteppingStone("Wear a bright color"),
      const SteppingStone("Workout"),
      const SteppingStone("Try to have a conversation with someone"),
      const SteppingStone("Workout"),
      const SteppingStone("Travel through time to kill Hitler")
    ].reversed; // NOTE The most recent ones must appear at the beginning

    var addButton = FloatingActionButton.extended(
      onPressed: (){},
      backgroundColor: Colors.lightBlue,
      label: const Row(
        children: [
          Icon(Icons.hive_outlined,
            size: 40,
          ),
          Text("Add new\nStepping Stone",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      heroTag: false,
    );

    var steppingStones = ListView.separated(
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
                    return tasks.elementAt(index);
                  },
                  padding: EdgeInsets.symmetric(vertical: 40),
                );

    return Scaffold(
        appBar: steppingBar,
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          child: Stack(
            children: [
              Center(
                child: steppingStones
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: addButton
              )
            ],
          ) ,
        ),
        //
        // add_task_sharp

        // TODO Stretch buttons & add top padding
        bottomNavigationBar: BottomAppBar(
          height: 100,
          padding: const EdgeInsets.all(0.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  color: Colors.amber,
                  child: Center(
                    child: InkWell(
                        onTap: () { Navigator.pop(context); },
                        child: const Column(
                          children: [
                            Icon(Icons.local_florist,
                              size: 40,
                            ),
                            Text("Go to your Goals",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ),
                ),
              ),
              Expanded(child: Center(
                child: InkWell(
                    onTap: () {  },
                    child: const Column(
                      children: [
                        Icon(Icons.auto_stories,
                          size: 40,
                        ),
                        Text("Switch to Journal",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
              ),
              ),
            ],
          ),
        ),
    );
  }
}
