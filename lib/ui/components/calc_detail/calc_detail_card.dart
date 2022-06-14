import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/util/formatter.dart';
import 'package:warikan_app/ui/components/calc_detail/payment_detail_list.dart';
import 'package:warikan_app/ui/components/common/style/dark_blue_card.dart';
import 'package:warikan_app/ui/viewmodels/calc_detail_viewmodel.dart';

class CalcDetailCard extends StatelessWidget {
  //メンバー毎の支払い情報を表示するコンポーネント
  const CalcDetailCard({
    Key? key,
    required this.memberIndex,
  }) : super(key: key);

  final int memberIndex;

  @override
  Widget build(BuildContext context) {
    final vm = context.read<CalcDetailViewModel>();
    final member = vm.split.members[memberIndex];
    return DarkBlueCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Name: ${member.name}",
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "Payment: ${Formatter.numberFormatter.format(member.costPerMember)}",
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          PaymentDetailList(
            memberIndex: memberIndex,
          ),
        ],
      ),
    );
  }
}
