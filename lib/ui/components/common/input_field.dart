import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.onChanged,
      this.validator,
      this.color = Colors.white})
      : super(key: key);

  //フォーム入力時処理
  final ValueChanged<String> onChanged;
  //バリデーション
  final FormFieldValidator<String>? validator;
  //フォームの色
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: color,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      validator: validator,
    );
  }
}
