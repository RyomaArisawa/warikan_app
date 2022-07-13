import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:split/data/consts/texts.dart';
import 'package:split/ui/components/calc_detail/calc_detail_card.dart';
import 'package:split/ui/components/calc_detail/display_total_card.dart';
import 'package:split/ui/components/calc_detail/member_name_buttons.dart';
import 'package:split/ui/components/common/custom_floating_action_button.dart';
import 'package:split/ui/components/common/cutom_app_bar.dart';
import 'package:split/ui/components/common/style/body_background.dart';
import 'package:split/ui/viewmodels/calc_detail_viewmodel.dart';

class CalcDetailScreen extends StatefulWidget {
  ///CalcDetail画面
  const CalcDetailScreen({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const CalcDetailScreen(),
    );
  }

  @override
  State<CalcDetailScreen> createState() => _CalcDetailScreenState();
}

class _CalcDetailScreenState extends State<CalcDetailScreen> {
  final controller = PageController(viewportFraction: 0.9, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final vm = context.read<CalcDetailViewModel>();
    return Scaffold(
      appBar: CustomAppBar(
        title: ScreenLabels.calc,
        actions: [
          Visibility(
            visible: !vm.split.isSettled,
            child: IconButton(
              onPressed: () => vm.showSettleDialog(context),
              icon: const Icon(Icons.done),
              tooltip: ButtonLabels.settle,
            ),
          ),
        ],
      ),
      body: BodyBackground(
        child: Column(
          children: [
            const DisplayTotalCard(),
            const SizedBox(
              height: 5,
            ),
            MemberNameButtons(controller: controller),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: vm.split.members.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CalcDetailCard(
                      memberIndex: index,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: !vm.split.isSettled,
        child: CustomFloatingActionButton(
          onPressed: () => vm.pushCalcInput(context),
          buttonLabel: ButtonLabels.edit.toUpperCase(),
          iconData: IconlyLight.edit,
        ),
      ),
    );
  }
}
