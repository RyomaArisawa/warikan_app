import 'package:flutter/material.dart';
import 'package:warikan_app/data/consts/custom_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  ///共通AppBarコンポーネント
  const CustomAppBar({
    Key? key,
    required this.title,
    this.height = 60,
    this.color = CustomColors.darkBlue,
  }) : super(key: key);

  final String title;
  final double height;
  final Color color;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: AppBar(
        backgroundColor: color,
        centerTitle: true,
        title: Text(title),
      ),
      preferredSize: Size.fromHeight(height),
    );
  }
}
