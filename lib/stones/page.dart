import 'package:flutter/material.dart';
import 'package:stepping_stones/stones/model.dart';
import 'package:stepping_stones/stones/status.dart';

class SteppingStonePage extends StatefulWidget {
  const SteppingStonePage(this.notifier, {super.key});

  final SteppingStoneModel notifier;

  @override
  State<SteppingStonePage> createState() => _SteppingStonePageState();
}

class _SteppingStonePageState extends State<SteppingStonePage> {
  var readOnly = true;
  @override
  Widget build(BuildContext context) {

    return ListenableBuilder(
      listenable: widget.notifier,
      builder: (context, child) {
        final String goal = widget.notifier.task;
        final StoneStatus status = widget.notifier.status;
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            //leading: InkWell(Text),
            toolbarHeight: 100,
            centerTitle: true,
            backgroundColor: Colors.lightBlue,//Theme.of(context).colorScheme.tertiary,
            title: InkWell(
              onTap: () => showDialog(context: context,
                builder: (BuildContext context) {
                  var controller = TextEditingController(text: goal);
                  void save() {
                    if (controller.text.isNotEmpty) {
                      widget.notifier.changeName(controller.text);
                      Navigator.pop(context);
                    }
                  }
                  return Dialog(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppBar(title: const Text("Enter new name"),),
                        SafeArea(
                          minimum: const EdgeInsets.symmetric(
                            vertical: 50,
                            horizontal: 20
                          ),
                          child: Column(
                            children: [
                              TextFormField(
                                 controller: controller,
                                 onEditingComplete: save,
                                 maxLength: 50,
                                 autofocus: true,
                                 validator: (value) {
                                   if (value == null || value.isEmpty) {
                                     return "Please add something!";
                                   }
                                   return null;
                                 },
                               ),
                               Align(
                                 alignment: Alignment.bottomCenter,
                                 child: FloatingActionButton.extended(
                                   label: const Text("Change the stone's name"),
                                   onPressed: save,
                              ),
                               ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              ),
              child: Text(goal,
                overflow: TextOverflow.clip,
                softWrap: true,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),

          body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    width: 300,
                    child: Column(
                      children: [
                        const Text("Current status:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: DropdownButton(
                              value: status,
                              icon: const Text(""),
                              iconSize: 0,
                              underline: const Text(""),
                              alignment: Alignment.center,
                              elevation: 100,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black
                              ),
                              items: StoneStatus.values.map((status) => DropdownMenuItem(value: status,
                                  child: Row(
                                    children: [
                                      Icon(status.icon, color: status.color,),
                                      const VerticalDivider(width: 20, color: Colors.transparent,),
                                      Text(status.label),
                                    ],
                                  )
                                )
                              ).toList(),
                              onChanged: (selected) => widget.notifier.changeStatus(selected),
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: FloatingActionButton.extended(
                          backgroundColor: Colors.lightBlue,
                          label: const Row(
                            children: [
                              Icon(Icons.auto_stories,
                                size: 20,
                              ),
                              Text("Add new Journal Entry",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          onPressed: (){},
                          ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ),
          // bottomNavigationBar: BottomAppBar(
          //   height: 100,
          //   padding: const EdgeInsets.all(0.0),
          //   child:
          //     Container(
          //       color: Colors.amber,
          //       child: InkWell(
          //         onTap: () { Navigator.pop(context); },
          //         child: const Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Icon(Icons.hive_outlined,
          //               size: 40,
          //             ),
          //             Text("Go back to\n\",
          //               textAlign: TextAlign.center,
          //               style: TextStyle(
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 17,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          // ),
        );
      }
    );
  }
}
