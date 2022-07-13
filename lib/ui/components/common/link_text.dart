import 'package:flutter/material.dart';
import 'package:split/data/consts/custom_colors.dart';

class LinkText extends StatelessWidget {
  /// リンクテキストのコンポーネント
  const LinkText(
      {Key? key,
      required this.plainText,
      required this.linkText,
      required this.onTap,
      this.linkColor = CustomColors.indigo})
      : super(key: key);

  //プレーンのテキスト
  final String plainText;
  //リンクのテキスト
  final String linkText;
  //リンク押下時処理
  final VoidCallback onTap;
  //リンクの色
  final Color linkColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: plainText),
            const TextSpan(text: " "),
            TextSpan(
              text: linkText,
              style: TextStyle(color: linkColor),
            ),
          ],
        ),
      ),
    );
  }
}
