import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  ///共通入力フォームラベルコンポーネント
  const InputLabel({
    Key? key,
    required this.label,
    this.color = Colors.white,
    this.fontSize = 16,
  }) : super(key: key);

  //フォームラベル
  final String label;
  //ラベルの色
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
