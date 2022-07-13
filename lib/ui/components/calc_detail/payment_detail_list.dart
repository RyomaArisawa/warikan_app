import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split/data/util/formatter.dart';
import 'package:split/ui/components/common/style/bottom_shader.dart';
import 'package:split/ui/viewmodels/calc_detail_viewmodel.dart';

class PaymentDetailList extends StatelessWidget {
  //メンバーに紐づく支払い情報を一覧リストにして表示するコンポーネント
  const PaymentDetailList({
    Key? key,
    required this.memberIndex,
  }) : super(key: key);

  final int memberIndex;

  @override
  Widget build(BuildContext context) {
    final vm = context.read<CalcDetailViewModel>();
    final member = vm.split.members[memberIndex];

    return SizedBox(
      height: 170,
      child: BottomShader(
        child: ListView.builder(
          itemCount: member.payments.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: Text(member.payments[index].item),
              subtitle: Text(Formatter.formatCost(member.payments[index].cost)),
            ),
          ),
        ),
      ),
    );
  }
}
