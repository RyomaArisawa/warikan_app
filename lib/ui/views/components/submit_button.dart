import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  SubmitButton({
    required this.buttonLabel,
    required this.onPressed,
    this.width = 100,
    this.height = 50,
    this.buttonColor,
  });

  // ボタン内に表示するテキスト
  final String buttonLabel;

  // ボタン押下時に実行する関数
  final VoidCallback onPressed;

  // ボタンの幅
  final double width;

  // ボタンの高さ
  final double height;

  // ボタンの色
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(primary: buttonColor),
        child: Text(buttonLabel),
      ),
    );
  }
}
