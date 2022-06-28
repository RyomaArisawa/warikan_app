import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:warikan_app/data/consts/custom_colors.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/data/models/member.dart';
import 'package:warikan_app/ui/components/calc_input/member_name_buttons.dart';
import 'package:warikan_app/ui/components/calc_input/calc_total_card.dart';
import 'package:warikan_app/ui/components/calc_input/member_input.dart';
import 'package:warikan_app/ui/components/common/custom_floating_action_button.dart';
import 'package:warikan_app/ui/components/common/cutom_app_bar.dart';
import 'package:warikan_app/ui/components/common/style/body_background.dart';
import 'package:warikan_app/ui/components/common/style/bottom_shader.dart';
import 'package:warikan_app/ui/components/common/wide_button.dart';
import 'package:warikan_app/ui/viewmodels/calc_input_viewmodel.dart';

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
            const CalcTotalCard(),
            MemberNameButtons(controller: controller),
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: vm.members.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                      child: MemberInput(key: UniqueKey(), memberIndex: index));
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        iconData: Icons.check,
        buttonLabel: ButtonLabels.save,
        onPressed: () {},
      ),
    );
  }
}
