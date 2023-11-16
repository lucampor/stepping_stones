import 'package:flutter/material.dart';

enum StoneStatus {
  ongoing(Icons.album_outlined, Colors.lightBlue),
  completed(Icons.album, Colors.lightBlue),
  dropped(Icons.copyright_sharp, Colors.grey);

  const StoneStatus(
    this.icon,
    this.color,
  );

  final IconData icon;
  final Color color;
}
