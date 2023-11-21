import 'package:flutter/material.dart';

enum StoneStatus {
  ongoing("Ongoing", Icons.album_outlined, Colors.lightBlue),
  completed("Completed", Icons.album, Colors.lightBlue),
  dropped("Dropped", Icons.copyright_sharp, Colors.grey);

  const StoneStatus(
    this.label,
    this.icon,
    this.color,
  );

  final String label;
  final IconData icon;
  final Color color;
}
