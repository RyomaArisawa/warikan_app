import 'package:flutter/material.dart';
import 'package:warikan_app/data/consts/custom_colors.dart';

class CustomListCard extends StatelessWidget {
  const CustomListCard({Key? key, required this.child, required this.onTap})
      : super(key: key);

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: CustomColors.indigo.withOpacity(0.8),
      elevation: 12,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: child,
      ),
    );
  }
}
