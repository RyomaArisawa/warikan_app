import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:warikan_app/data/consts/custom_colors.dart';

class CalcListCard extends StatelessWidget {
  ///CalcOverview画面のリストタイルコンポーネント
  const CalcListCard({Key? key, this.color = Colors.white70}) : super(key: key);
  //const CalcListCard({Key? key, required this.amountOfMoney, required this.date, required this.numberOfMembers,}) : super(key: key);

  // final String amountOfMoney;
  // final String date;
  // final int numberOfMembers;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 12,
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.indigo,
          borderRadius: BorderRadius.circular(20),
        ),
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
            "amount",
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
            IconlyLight.arrow_right_2,
            color: color,
          ),
        ),
      ),
    );
  }
}
