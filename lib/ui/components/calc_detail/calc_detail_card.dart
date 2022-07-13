import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split/data/models/calc_result.dart';
import 'package:split/ui/components/calc_detail/calc_result_card.dart';
import 'package:split/ui/components/calc_detail/payment_detail_list.dart';
import 'package:split/ui/components/common/style/dark_blue_card.dart';
import 'package:split/ui/viewmodels/calc_detail_viewmodel.dart';

class CalcDetailCard extends StatelessWidget {
  ///メンバー毎の支払い情報を表示するコンポーネント
  const CalcDetailCard({
    Key? key,
    required this.memberIndex,
  }) : super(key: key);

  final int memberIndex;

  @override
  Widget build(BuildContext context) {
    final vm = context.read<CalcDetailViewModel>();
    final member = vm.split.members[memberIndex];
    final List<CalcResult?> calcResultsPerMember =
        vm.calcResults.where((e) => e?.sender == member.name).toList();

    return DarkBlueCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            member.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: CalcResultCard(
              calcResultsPerMember: calcResultsPerMember,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          PaymentDetailList(
            memberIndex: memberIndex,
          ),
        ],
      ),
    );
  }
}
