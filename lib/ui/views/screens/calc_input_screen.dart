import 'package:flutter/material.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/components/common/cutom_app_bar.dart';

class CalcInputScreen extends StatelessWidget {
  const CalcInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: ScreenLabels.calc,
      ),
      body: Container(),
    );
  }
}
