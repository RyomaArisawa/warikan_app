import 'package:flutter/material.dart';
import 'package:split/data/consts/custom_colors.dart';

class CustomListCard extends StatelessWidget {
  ///共通リストカードコンポーネント
  const CustomListCard(
      {Key? key,
      required this.child,
      required this.onTap,
      this.onLongPress,
      this.color = CustomColors.indigo})
      : super(key: key);

  final Widget child;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: color,
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
