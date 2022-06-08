import 'package:flutter/material.dart';
import 'package:warikan_app/data/consts/custom_colors.dart';

class CustomListCard extends StatelessWidget {
  const CustomListCard(
      {Key? key, required this.child, required this.onTap, this.onLongPress})
      : super(key: key);

  final Widget child;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: CustomColors.indigo,
      elevation: 12,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        onLongPress: onLongPress,
        child: child,
      ),
    );
  }
}
