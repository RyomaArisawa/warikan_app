import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/components/common/custom_floating_action_button.dart';
import 'package:warikan_app/ui/components/common/cutom_app_bar.dart';
import 'package:warikan_app/ui/components/common/style/body_background.dart';
import 'package:warikan_app/ui/components/common/style/bottom_shader.dart';
import 'package:warikan_app/ui/components/memo_overview/memo_list_card.dart';
import 'package:warikan_app/ui/viewmodels/memo_overview_viewmodel.dart';

class MemoOverviewScreen extends StatelessWidget {
  const MemoOverviewScreen({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const MemoOverviewScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MemoOverviewViewModel>();
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
            child: ListView.builder(
              itemCount: vm.memoList.length,
              itemBuilder: (context, index) => MemoListCard(
                memoIndex: index,
                onTap: () => vm.pushMemoDetail(context, index),
              ),
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
