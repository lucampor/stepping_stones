import 'package:flutter/material.dart';
import 'package:stepping_stones/stones/data.dart';

class SteppingStoneEntry extends StatelessWidget {
  const SteppingStoneEntry(this.data, {super.key});

  final SteppingStoneData data;

  @override
  Widget build(BuildContext context) {
    var size = 30.0;

    return InkWell(
      onTap: () {print(data.task);},
      child: ClipRRect(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black45,
              width: 4
            )
          ),
          child: Row(
            children: [
              Icon(data.status.icon,
                size: size*(6/4),
                color: data.status.color,
              ),
              const VerticalDivider(),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.task,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: size
                      ),
                    ),
                    Text(data.status.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: size*(4/6)
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


