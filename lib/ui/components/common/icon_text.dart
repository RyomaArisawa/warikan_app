import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  ///共通アイコンテキストコンポーネント
  const IconText(
      {Key? key,
      required this.text,
      required this.icon,
      required this.onTap,
      this.textColor = Colors.white,
      this.iconColor = Colors.white})
      : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final Color textColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text,
          style: TextStyle(color: textColor),
        ),
        InkWell(
          onTap: onTap,
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ],
    );
  }
}
