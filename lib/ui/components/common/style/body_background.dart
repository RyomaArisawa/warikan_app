import 'package:flutter/material.dart';
import 'package:split/data/consts/custom_colors.dart';

class BodyBackground extends StatelessWidget {
  ///背景コンポーネント
  const BodyBackground({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
          colors: [
            CustomColors.lightBlue.withOpacity(0.3),
            CustomColors.darkBlue.withOpacity(0.5),
          ],
        ),
      ),
      child: child,
    );
  }
}
