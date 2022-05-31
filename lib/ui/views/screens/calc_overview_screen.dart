import 'package:flutter/material.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/components/calc_overview/calc_list_card.dart';
import 'package:warikan_app/ui/components/common/body_background.dart';
import 'package:warikan_app/ui/components/common/cutom_app_bar.dart';

class CalcOverviewScreen extends StatelessWidget {
  const CalcOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: ScreenLabels.calc,
      ),
      body: BodyBackground(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => CalcListCard(),
        ),
      ),
    );
  }
}
