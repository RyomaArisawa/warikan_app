import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split/data/consts/texts.dart';
import 'package:split/ui/components/common/custom_floating_action_button.dart';
import 'package:split/ui/components/common/cutom_app_bar.dart';
import 'package:split/ui/components/common/style/body_background.dart';
import 'package:split/ui/components/common/style/bottom_shader.dart';
import 'package:split/ui/components/memo_overview/memo_list_card.dart';
import 'package:split/ui/viewmodels/memo_overview_viewmodel.dart';

class MemoOverviewScreen extends StatelessWidget {
  const MemoOverviewScreen({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const MemoOverviewScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.read<MemoOverviewViewModel>();
    //ユーザーに紐づくメモの一覧を取得
    Future(() => vm.getMemoByUserId());

    return Scaffold(
      appBar: const CustomAppBar(
        title: ScreenLabels.memo,
      ),
      body: BodyBackground(
        child: Scrollbar(
          radius: const Radius.circular(20),
          child: BottomShader(
            child: Consumer<MemoOverviewViewModel>(
              builder: (context, vm, _) {
                return ListView.builder(
                  itemCount: vm.memos.length,
                  itemBuilder: (context, index) => MemoListCard(
                    memoIndex: index,
                    onTap: () => vm.pushMemoDetail(context, index),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () => vm.pushMemoInput(context),
      ),
    );
  }
}
