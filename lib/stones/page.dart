import 'package:flutter/material.dart';
import 'package:stepping_stones/stones/model.dart';

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
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          centerTitle: true,
          backgroundColor: Colors.lightBlue,//Theme.of(context).colorScheme.tertiary,
          // actions: const [
          //   Icon(Icons.filter_alt_rounded, size: 60, color: Colors.black,)
          // ]

          title: ListenableBuilder(
            listenable: widget.notifier,
            builder: (context, child) {
              final String goal = widget.notifier.task;

              return InkWell(
                onLongPress: () => showDialog(context: context,
                  builder: (BuildContext context) {
                    var controller = TextEditingController(text: goal);
                    void save() {
                      if (controller.text.isNotEmpty) {
                        widget.notifier.changeName(controller.text);
                        Navigator.pop(context);
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(content: Text('Processing Data')),
                        // );
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
                                     label: const Text("Add new stone!"),
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
                onDoubleTap: () => Navigator.pop(context),
                child: Text(goal,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              );
            }
          ),
        ),
    );
  }
}
