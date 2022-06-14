import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/components/common/custom_floating_action_button.dart';
import 'package:warikan_app/ui/components/common/cutom_app_bar.dart';
import 'package:warikan_app/ui/components/common/style/body_background.dart';
import 'package:warikan_app/ui/viewmodels/memo_detail_viewmodel.dart';

class MemoDetailScreen extends StatelessWidget {
  /// Memo Detail画面
  const MemoDetailScreen({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const MemoDetailScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.read<MemoDetailViewModel>();
    return Scaffold(
      appBar: const CustomAppBar(
        title: ScreenLabels.memo,
      ),
      body: BodyBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              vm.memo.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () => vm.pushMemoInput(context),
        buttonLabel: ButtonLabels.edit.toUpperCase(),
        iconData: IconlyLight.edit,
      ),
    );
  }
}
