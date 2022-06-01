import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/consts/custom_colors.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/components/common/icon_text.dart';
import 'package:warikan_app/ui/components/common/input_field.dart';
import 'package:warikan_app/ui/viewmodels/calc_input_viewmodel.dart';

class PaymentInput extends StatelessWidget {
  /// 金額情報入力コンポーネント
  const PaymentInput(
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
        color: CustomColors.lightBlue,
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
          InputField(
            hintText: FormLabels.title,
            contentPadding: 0,
            onChanged: (String name) {},
          ),
          InputField(
            hintText: FormLabels.amount,
            contentPadding: 0,
            onChanged: (String name) {},
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
