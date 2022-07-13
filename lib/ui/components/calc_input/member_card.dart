import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:split/data/consts/texts.dart';
import 'package:split/ui/components/calc_input/payment_card.dart';
import 'package:split/ui/components/common/custom_button.dart';
import 'package:split/ui/components/common/icon_text.dart';
import 'package:split/ui/components/common/style/bottom_shader.dart';
import 'package:split/ui/components/common/style/dark_blue_card.dart';
import 'package:split/ui/viewmodels/calc_input_viewmodel.dart';

class MemberCard extends StatelessWidget {
  /// メンバー情報表示カードコンポーネント
  const MemberCard({Key? key, required this.memberIndex}) : super(key: key);

  // メンバーを特定するインデックス
  final int memberIndex;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CalcInputViewModel>();

    return DarkBlueCard(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.55,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    vm.members[memberIndex].name,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconText(
                  text: ButtonLabels.delete,
                  icon: IconlyLight.delete,
                  onTap: () => vm.deleteMember(memberIndex),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: BottomShader(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2.3,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: vm.members[memberIndex].payments.length,
                    itemBuilder: (context, index) => PaymentCard(
                      key: UniqueKey(),
                      memberIndex: memberIndex,
                      paymentIndex: index,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              text: ButtonLabels.addPayment,
              onPressed: () => vm.addPayment(memberIndex),
              height: 30,
              width: 140,
            ),
          ],
        ),
      ),
    );
  }
}
