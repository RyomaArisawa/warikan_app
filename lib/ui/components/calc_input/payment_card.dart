import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:split/data/consts/custom_colors.dart';
import 'package:split/data/consts/texts.dart';
import 'package:split/ui/components/common/icon_text.dart';
import 'package:split/ui/components/common/input_field.dart';
import 'package:split/ui/viewmodels/calc_input_viewmodel.dart';

class PaymentCard extends StatelessWidget {
  /// 金額情報入力カードコンポーネント
  const PaymentCard(
      {Key? key, required this.memberIndex, required this.paymentIndex})
      : super(key: key);

  // メンバーを特定するインデックス
  final int memberIndex;
  // メンバーに紐づく支払い情報を特定するインデックス
  final int paymentIndex;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CalcInputViewModel>();

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
        color: CustomColors.lightBlue.withOpacity(0.3),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          IconText(
            text: ButtonLabels.delete,
            icon: IconlyLight.delete,
            onTap: () => vm.deletePayment(memberIndex, paymentIndex),
          ),
          const SizedBox(
            height: 10,
          ),
          //支払い項目名
          InputField(
            //スクロールなどでdisposeされても値を保持するために初期値をセット
            initialValue: vm.members[memberIndex].payments[paymentIndex].item,
            hintText: FormLabels.item,
            contentPadding: 0,
            onChanged: (String item) =>
                vm.inputPaymentItem(item, memberIndex, paymentIndex),
          ),
          //支払い金額
          InputField(
            //スクロールなどでdisposeされても値を保持するために初期値をセット
            initialValue:
                vm.members[memberIndex].payments[paymentIndex].cost.toString(),
            hintText: FormLabels.cost,
            contentPadding: 0,
            isNumberOnly: true,
            keyboardType: TextInputType.number,
            onChanged: (String cost) {
              vm.inputCost(cost, memberIndex, paymentIndex);
            },
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
