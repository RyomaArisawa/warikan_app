import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/components/calc_input/calc_total_card.dart';
import 'package:warikan_app/ui/components/calc_input/member_input.dart';
import 'package:warikan_app/ui/components/common/cutom_app_bar.dart';
import 'package:warikan_app/ui/components/common/style/body_background.dart';
import 'package:warikan_app/ui/components/common/style/bottom_shader.dart';
import 'package:warikan_app/ui/components/common/wide_button.dart';
import 'package:warikan_app/ui/viewmodels/calc_input_viewmodel.dart';

class CalcInputScreen extends StatelessWidget {
  ///CalcInput画面
  const CalcInputScreen({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const CalcInputScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CalcInputViewModel>();

    return Scaffold(
      appBar: const CustomAppBar(
        title: ScreenLabels.calc,
      ),
      body: BodyBackground(
        child: Column(
          children: [
            const CalcTotalCard(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Scrollbar(
                radius: const Radius.circular(20),
                isAlwaysShown: true,
                child: BottomShader(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: vm.members.length,
                    itemBuilder: (context, index) => MemberInput(
                      //ウィジェットを一意に特定するKey
                      key: UniqueKey(),
                      memberIndex: index,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WideButton(
                  text: ButtonLabels.addMember,
                  onPressed: vm.addMember,
                  height: 40,
                  width: MediaQuery.of(context).size.width / 3,
                ),
                const SizedBox(
                  width: 20,
                ),
                WideButton(
                  text: ButtonLabels.save,
                  onPressed: vm.addMember,
                  height: 40,
                  width: MediaQuery.of(context).size.width / 3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
