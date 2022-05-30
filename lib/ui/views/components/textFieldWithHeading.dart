import 'package:flutter/material.dart';

class TextFieldWithHeading extends StatelessWidget {
  const TextFieldWithHeading({
    Key? key,
    required this.heading,
    required this.textEditingController,
    this.headingColor = Colors.black,
  }) : super(key: key);

  // TextFiled上部に表示する見出し
  final String heading;

  // 見出しの文字色
  final Color headingColor;

  // TextFiledのコントローラー
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            heading,
            style: TextStyle(color: headingColor),
          ),
        ),
        TextField(
          style: const TextStyle(color: Colors.black),
          controller: textEditingController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }
}
