import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  ///共通入力フォームコンポーネント
  const InputField({
    Key? key,
    required this.onChanged,
    this.validator,
    this.color = Colors.white,
    this.hintText,
    this.contentPadding,
    this.initialValue,
    this.keyboardType,
    this.isNumberOnly = false,
    this.onEditingCompleted,
    this.maxLines = 1,
    this.height = 50,
  }) : super(key: key);

  //フォーム入力時処理
  final ValueChanged<String> onChanged;
  //バリデーション
  final FormFieldValidator<String>? validator;
  //フォームの色
  final Color color;
  //プレースホルダー
  final String? hintText;
  //フォームの余白
  final double? contentPadding;
  //初期値
  final String? initialValue;
  //キーボードタイプ
  final TextInputType? keyboardType;
  //数値のみ入力可能
  final bool isNumberOnly;
  //編集完了時処理
  final VoidCallback? onEditingCompleted;
  //最大行数
  final int? maxLines;
  //高さ
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        onEditingComplete: onEditingCompleted,
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
        maxLines: maxLines,
        keyboardType: keyboardType,
        inputFormatters:
            isNumberOnly ? [FilteringTextInputFormatter.digitsOnly] : [],
      ),
    );
  }
}
