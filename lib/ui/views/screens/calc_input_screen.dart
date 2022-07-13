import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split/data/consts/texts.dart';
import 'package:split/ui/components/calc_input/member_card.dart';
import 'package:split/ui/components/calc_input/member_name_buttons.dart';
import 'package:split/ui/components/common/custom_floating_action_button.dart';
import 'package:split/ui/components/common/cutom_app_bar.dart';
import 'package:split/ui/components/common/style/body_background.dart';
import 'package:split/ui/viewmodels/calc_input_viewmodel.dart';

import '../../components/calc_input/member_name_input.dart';

class CalcInputScreen extends StatefulWidget {
  ///CalcInput画面
  const CalcInputScreen({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const CalcInputScreen(),
    );
  }

  @override
  State<StatefulWidget> createState() => _CalcInputScreenState();
}

class _CalcInputScreenState extends State<CalcInputScreen> {
  final controller = PageController(viewportFraction: 0.9, keepPage: true);

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
            const MemberNameInput(),
            const SizedBox(
              height: 10,
            ),
            MemberNameButtons(controller: controller),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: vm.members.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                      child: MemberCard(key: UniqueKey(), memberIndex: index));
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: vm.members.isNotEmpty,
        child: CustomFloatingActionButton(
          iconData: Icons.check,
          buttonLabel: ButtonLabels.save,
          onPressed: () => vm.showSaveDialog(context),
        ),
      ),
    );
  }
}
