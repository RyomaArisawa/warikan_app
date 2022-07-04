import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:warikan_app/data/models/split.dart';
import 'package:warikan_app/data/util/formatter.dart';
import 'package:warikan_app/ui/components/common/custom_list_card.dart';

class CalcListCard extends StatelessWidget {
  ///CalcOverview画面のリストタイルコンポーネント
  //暫定的コンストラクタ
  const CalcListCard(
      {Key? key,
      required this.split,
      this.color = Colors.white,
      required this.onTap})
      : super(key: key);

  final Split split;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomListCard(
      onTap: onTap,
      child: ListTile(
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          padding: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: 2.0, color: color),
            ),
          ),
          child: Icon(
            split.isSettled
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank,
            color: color,
          ),
        ),
        title: Text(
          split.title,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Text(
              Formatter.formatDate(split.createdAt),
              style: TextStyle(color: color),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              Formatter.formatCost(split.totalCost),
              style: TextStyle(color: color),
            ),
          ],
        ),
        trailing: Icon(
          IconlyLight.arrow_right_2,
          color: color,
        ),
      ),
    );
  }
}
