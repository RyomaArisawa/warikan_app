import 'package:flutter/material.dart';

import '../../../data/consts/custom_colors.dart';

class WideButton extends StatelessWidget {
  /// 共通ボタンコンポーネント
  const WideButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.textColor = Colors.white70,
    this.buttonColor = CustomColors.indigo,
    this.width = double.infinity,
    this.height = 60,
  }) : super(key: key);

  //ボタン押下時処理
  final VoidCallback onPressed;
  //
  final String text;
  final Color textColor;
  final Color buttonColor;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
        ),
      ),
    );
  }
}
