import 'package:flutter/material.dart';
import 'package:split/data/consts/custom_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  ///共通AppBarコンポーネント
  const CustomAppBar({
    Key? key,
    required this.title,
    this.height = 60,
    this.color = CustomColors.darkBlue,
    this.actions,
  }) : super(key: key);

  final String title;
  final double height;
  final Color color;
  final List<Widget>? actions;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: AppBar(
        backgroundColor: color,
        centerTitle: true,
        title: Text(title),
        actions: actions ?? [],
      ),
      preferredSize: Size.fromHeight(height),
    );
  }
}
