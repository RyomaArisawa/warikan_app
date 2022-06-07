import 'package:flutter/material.dart';
import 'package:warikan_app/data/consts/custom_colors.dart';
import 'package:warikan_app/data/consts/texts.dart';

class CustomFloatingActionButton extends StatelessWidget {
  ///共通FloatingActionButtonコンポーネント
  const CustomFloatingActionButton({Key? key, required this.onPressed})
      : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: CustomColors.darkBlue,
      icon: const Icon(Icons.add),
      label: const Text(ButtonLabels.create),
      onPressed: onPressed,
    );
  }
}
