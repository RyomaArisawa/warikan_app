import 'package:flutter/material.dart';
import 'package:warikan_app/data/consts/custom_colors.dart';

class DarkBlueCard extends StatelessWidget {
  const DarkBlueCard({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [CustomColors.lightBlue, CustomColors.darkBlue],
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: child,
    );
  }
}
