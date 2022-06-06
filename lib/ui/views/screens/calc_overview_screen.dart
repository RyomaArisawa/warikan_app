import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/consts/custom_colors.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/components/calc_overview/calc_list_card.dart';
import 'package:warikan_app/ui/components/common/cutom_app_bar.dart';
import 'package:warikan_app/ui/components/common/style/body_background.dart';
import 'package:warikan_app/ui/components/common/style/bottom_shader.dart';
import 'package:warikan_app/ui/viewmodels/calc_overview_viewmodel.dart';

class CalcOverviewScreen extends StatelessWidget {
  /// CalcOverview画面
  const CalcOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.read<CalcOverviewViewModel>();
    return Scaffold(
      appBar: const CustomAppBar(
        title: ScreenLabels.calc,
      ),
      body: BodyBackground(
        child: Scrollbar(
          radius: const Radius.circular(20),
          child: BottomShader(
            child: ListView.builder(
              itemCount: vm.splitInfoList.length,
              itemBuilder: (context, index) => CalcListCard(
                onTap: () => vm.pushCalcDetail(context, index),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: CustomColors.darkBlue,
        icon: const Icon(Icons.add),
        label: const Text(ButtonLabels.create),
        onPressed: () => vm.pushCalcInput(context),
      ),
    );
  }
}
