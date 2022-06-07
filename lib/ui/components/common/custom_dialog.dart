import 'package:flutter/material.dart';
import 'package:warikan_app/data/consts/custom_colors.dart';
import 'package:warikan_app/data/consts/texts.dart';

class CustomDialog extends StatelessWidget {
  ///共通ダイアログコンポーネント
  const CustomDialog(
      {Key? key,
      required this.title,
      required this.content,
      required this.onPressed})
      : super(key: key);

  final String title;
  final String content;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(
        content,
      ),
      actions: [
        ElevatedButton(
          onPressed: onPressed,
          child: const Text(ButtonLabels.yes),
          style: ElevatedButton.styleFrom(primary: CustomColors.indigo),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(ButtonLabels.no),
          style: ElevatedButton.styleFrom(primary: CustomColors.lightBlue),
        )
      ],
    );
  }
}
