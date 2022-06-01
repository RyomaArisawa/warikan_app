import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.onChanged,
    this.validator,
    this.color = Colors.white,
    this.hintText,
    this.contentPadding,
  }) : super(key: key);

  //フォーム入力時処理
  final ValueChanged<String> onChanged;
  //バリデーション
  final FormFieldValidator<String>? validator;
  //フォームの色
  final Color color;
  final String? hintText;
  final double? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: contentPadding != null
            ? EdgeInsets.symmetric(vertical: contentPadding!, horizontal: 10)
            : null,
        fillColor: color,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: hintText,
      ),
      validator: validator,
      maxLines: 1,
    );
  }
}
