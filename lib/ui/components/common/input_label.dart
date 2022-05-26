import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  const InputLabel({
    Key? key,
    required this.label,
    this.color = Colors.white70,
    this.fontSize = 20,
  }) : super(key: key);

  final String label;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(color: color, fontSize: fontSize),
    );
  }
}
