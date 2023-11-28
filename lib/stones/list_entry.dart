import 'package:flutter/material.dart';
import 'package:stepping_stones/stones/data.dart';
import 'package:stepping_stones/stones/model.dart';
import 'package:stepping_stones/stones/page.dart';
import 'package:stepping_stones/stones/status.dart';

class SteppingStoneEntry extends StatelessWidget {
  const SteppingStoneEntry(this.data, {this.onTap, this.omitStatus = false, super.key});

  final SteppingStoneData data;
  final Function? onTap;
  final bool omitStatus;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {onTap ??
        Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) =>
            SteppingStonePage(SteppingStoneModel(data))));},
      child: StoneRect(data.task, status: data.status, omitStatus: omitStatus),
    );
  }
}

class StoneRect extends StatelessWidget {
  const StoneRect(this.task, {
    required this.omitStatus,
    required this.status,
    this.size = 20,
    this.overflow = TextOverflow.ellipsis,
    super.key,
  });

  final String task;
  final StoneStatus status;
  final double size;
  final bool omitStatus;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black45,
            width: 4
          )
        ),
        child: Row(
          children: [
            Icon(status.icon,
              size: size*(6/4),
              color: status.color,
            ),
            const VerticalDivider(),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task,
                    overflow: overflow,
                    style: TextStyle(
                      fontSize: size
                    ),
                  ),
                  if (!omitStatus)
                  Text(status.label,
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
    );
  }
}
