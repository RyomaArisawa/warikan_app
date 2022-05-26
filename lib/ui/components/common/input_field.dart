import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({Key? key, required this.onChanged, this.validator})
      : super(key: key);

  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: validator,
    );
  }
}
