import 'package:flutter/material.dart';
import 'package:stepping_stones/objectives/model.dart';
import 'package:stepping_stones/objectives/page.dart';

class ObjectiveEntry extends StatelessWidget {
  const ObjectiveEntry(this.notifier, {super.key});


  final ObjectiveModel notifier;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
            // switch (_current) {
            //   CurrentPage.journal => ObjectivePage.journal(notifier),
            //   CurrentPage.stepping => ObjectivePage.path(notifier)
            //   }
            ObjectivePage.path(notifier)
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
                child: ListenableBuilder(
                  listenable: notifier,
                  builder: (context, snapshot) {
                    return Text(
                      notifier.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    );
                  }
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
