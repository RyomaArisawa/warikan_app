import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split/data/consts/custom_colors.dart';
import 'package:split/data/consts/enum.dart';
import 'package:split/data/consts/texts.dart';
import 'package:split/ui/components/calc_overview/calc_list_card.dart';
import 'package:split/ui/components/common/custom_floating_action_button.dart';
import 'package:split/ui/components/common/cutom_app_bar.dart';
import 'package:split/ui/components/common/style/body_background.dart';
import 'package:split/ui/components/common/style/bottom_shader.dart';
import 'package:split/ui/viewmodels/calc_overview_viewmodel.dart';

class CalcOverviewScreen extends StatelessWidget {
  /// CalcOverview画面
  const CalcOverviewScreen({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const CalcOverviewScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.read<CalcOverviewViewModel>();
    //ユーザーに紐づく割り勘情報の一覧を取得
    Future(() => vm.getSplitsByUserId());

    return Scaffold(
      appBar: CustomAppBar(
        title: ScreenLabels.calc,
        actions: [
          PopupMenuButton(
            onSelected: vm.sortSelected,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SortOption>>[
              const PopupMenuItem(
                  child: Text(ButtonLabels.sortByDate), value: SortOption.date),
              const PopupMenuItem(
                child: Text(ButtonLabels.sortBySettled),
                value: SortOption.isSettle,
              ),
            ],
          ),
        ],
      ),
      body: BodyBackground(
        child: Scrollbar(
          radius: const Radius.circular(20),
          child: BottomShader(
            child: Consumer<CalcOverviewViewModel>(
              builder: (context, vm, _) {
                return ListView.builder(
                  itemCount: vm.splits.length,
                  itemBuilder: (context, index) => CalcListCard(
                    splitIndex: index,
                    onTap: () => vm.pushCalcDetail(context, index),
                    backgroundColor: vm.splits[index].isSettled
                        ? CustomColors.grey
                        : CustomColors.indigo,
                  ),
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () => vm.pushCalcInput(context),
      ),
    );
  }
}
