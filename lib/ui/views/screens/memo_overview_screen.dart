import 'package:flutter/material.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/components/common/custom_floating_action_button.dart';
import 'package:warikan_app/ui/components/common/cutom_app_bar.dart';

class MemoOverviewScreen extends StatelessWidget {
  const MemoOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: ScreenLabels.memo,
      ),
      body: Container(),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
