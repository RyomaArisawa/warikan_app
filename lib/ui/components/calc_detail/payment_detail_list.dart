import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/util/formatter.dart';
import 'package:warikan_app/ui/viewmodels/calc_detail_viewmodel.dart';

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
    final member = vm.splitInfo.members[memberIndex];

    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: member.paymentInfoList.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(
                "￥${Formatter.numberFormatter.format(member.paymentInfoList[index].cost)}"),
            subtitle: Text(member.paymentInfoList[index].title),
          ),
        ),
      ),
    );
  }
}
