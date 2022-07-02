import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../../../data/consts/texts.dart';
import '../../viewmodels/calc_input_viewmodel.dart';
import '../common/custom_button.dart';
import '../common/input_field.dart';

class MemberNameInput extends StatelessWidget {
  ///メンバー名入力コンポーネント
  const MemberNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CalcInputViewModel>();

    return Row(
      children: [
        Expanded(
          child: InputField(
            key: UniqueKey(),
            height: 40,
            onChanged: vm.inputMemberName,
            hintText: FormLabels.member,
            contentPadding: 10,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        CustomButton(
          width: 100,
          height: 40,
          iconData: IconlyLight.add_user,
          text: ButtonLabels.add,
          onPressed: () => vm.addMember(context),
        )
      ],
    );
  }
}
