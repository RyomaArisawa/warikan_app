import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:warikan_app/ui/components/common/style/indigo_list_card.dart';

class MemoListCard extends StatelessWidget {
  const MemoListCard({Key? key, required this.color, required this.onTap})
      : super(key: key);

  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IndigoListCard(
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
            IconlyLight.tick_square,
            color: color,
          ),
        ),
        title: Text(
          "memo",
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Text(
              "2022/05/31",
              style: TextStyle(color: color),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "members",
              style: TextStyle(color: color),
            ),
          ],
        ),
        trailing: Icon(
          IconlyLight.document,
          color: color,
        ),
      ),
    );
  }
}
