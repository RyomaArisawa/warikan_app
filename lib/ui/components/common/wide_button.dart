import 'package:flutter/material.dart';

class WideButton extends StatelessWidget {
  const WideButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.textColor = Colors.white70,
    this.buttonColor = Colors.indigoAccent,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      style: ElevatedButton.styleFrom(
        onPrimary: buttonColor,
      ),
    );
  }
}
