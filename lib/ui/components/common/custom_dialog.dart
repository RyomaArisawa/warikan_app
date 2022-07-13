import 'package:flutter/material.dart';
import 'package:split/data/consts/custom_colors.dart';
import 'package:split/data/consts/texts.dart';

class CustomDialog extends StatelessWidget {
  ///共通ダイアログコンポーネント
  const CustomDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.onPressed,
    this.primaryText = ButtonLabels.yes,
    this.secondaryText = ButtonLabels.no,
  }) : super(key: key);

  final String title;
  final Widget content;
  final VoidCallback onPressed;
  final String primaryText;
  final String secondaryText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: content,
      actions: [
        ElevatedButton(
          onPressed: onPressed,
          child: Text(primaryText),
          style: ElevatedButton.styleFrom(primary: CustomColors.indigo),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(secondaryText),
          style: ElevatedButton.styleFrom(primary: CustomColors.lightBlue),
        )
      ],
    );
  }
}
