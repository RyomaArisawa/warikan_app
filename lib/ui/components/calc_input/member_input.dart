import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/components/calc_input/money_amount_input.dart';
import 'package:warikan_app/ui/components/common/icon_text.dart';
import 'package:warikan_app/ui/components/common/input_field.dart';
import 'package:warikan_app/ui/components/common/style/bottom_shader.dart';
import 'package:warikan_app/ui/components/common/style/dark_blue_card.dart';
import 'package:warikan_app/ui/components/common/wide_button.dart';
import 'package:warikan_app/ui/viewmodels/calc_input_viewmodel.dart';

class MemberInput extends StatelessWidget {
  /// メンバー情報入力コンポーネント
  const MemberInput({Key? key, required this.memberIndex}) : super(key: key);

  // メンバーを特定するインデックス
  final int memberIndex;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CalcInputViewModel>();

    return DarkBlueCard(
      child: Column(
        children: [
          IconText(
            text: ButtonLabels.delete,
            icon: IconlyLight.delete,
            onTap: () => vm.deleteMember(memberIndex),
          ),
          const SizedBox(
            height: 10,
          ),
          //メンバー名
          InputField(
            //スクロールなどでdisposeされても値を保持するために初期値をセット
            initialValue: vm.members[memberIndex].name,
            onChanged: (String name) => vm.inputMemberName(name, memberIndex),
            hintText: FormLabels.member,
          ),
          const SizedBox(
            height: 10,
          ),
          BottomShader(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: vm.members[memberIndex].paymentInfoList.length,
                itemBuilder: (context, index) => PaymentInput(
                  key: UniqueKey(),
                  memberIndex: memberIndex,
                  paymentIndex: index,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          WideButton(
            text: ButtonLabels.addPayment,
            onPressed: () => vm.addPayment(memberIndex),
            height: 30,
            width: 200,
          ),
        ],
      ),
    );
  }
}
