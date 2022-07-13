import 'package:flutter/material.dart';
import 'package:split/data/consts/custom_colors.dart';
import 'package:split/data/consts/texts.dart';

class CustomFloatingActionButton extends StatelessWidget {
  ///共通FloatingActionButtonコンポーネント
  const CustomFloatingActionButton(
      {Key? key,
      required this.onPressed,
      this.iconData = Icons.add,
      this.buttonLabel = ButtonLabels.create})
      : super(key: key);

  final VoidCallback onPressed;
  final IconData iconData;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: CustomColors.darkBlue,
      icon: Icon(iconData),
      label: Text(buttonLabel.toUpperCase()),
      onPressed: onPressed,
    );
  }
}
