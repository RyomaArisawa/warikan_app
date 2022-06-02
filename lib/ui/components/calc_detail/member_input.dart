import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/components/calc_detail/money_amount_input.dart';
import 'package:warikan_app/ui/components/common/bottom_shader.dart';
import 'package:warikan_app/ui/components/common/icon_text.dart';
import 'package:warikan_app/ui/components/common/input_field.dart';
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

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
        color: Colors.indigo.withOpacity(0.8),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
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
          InputField(
            onChanged: (String name) => {},
            //onChanged: (String name) => vm.inputMemberName(name, memberIndex),
            hintText: FormLabels.member,
          ),
          const SizedBox(
            height: 10,
          ),
          BottomShader(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: vm.members[memberIndex].paymentInfoList.length,
                itemBuilder: (context, index) => PaymentInput(
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
