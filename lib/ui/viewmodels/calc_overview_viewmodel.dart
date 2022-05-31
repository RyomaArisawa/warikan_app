import 'package:flutter/material.dart';
import 'package:warikan_app/ui/views/screens/calc_detail_screen.dart';
import 'package:warikan_app/ui/views/screens/calc_input_screen.dart';

class CalcOverviewViewModel with ChangeNotifier {
  void pushCalcDetail(BuildContext context) {
    Navigator.push(
      context,
      CalcDetailScreen.route(),
    );
  }

  void pushCalcInput(BuildContext context) {
    Navigator.push(
      context,
      CalcInputScreen.route(),
    );
  }
}
