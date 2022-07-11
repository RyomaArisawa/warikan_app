import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/consts/enum.dart';
import 'package:warikan_app/data/models/calc_result.dart';
import 'package:warikan_app/data/models/split.dart';
import 'package:warikan_app/data/repositories/calc_repository.dart';
import 'package:warikan_app/data/util/dialog_helper.dart';
import 'package:warikan_app/data/util/util_logic.dart';
import 'package:warikan_app/ui/viewmodels/calc_input_viewmodel.dart';
import 'package:warikan_app/ui/views/screens/calc_input_screen.dart';

class CalcDetailViewModel with ChangeNotifier {
  CalcDetailViewModel({required this.calcRepository});
  CalcRepository calcRepository;

  Split _split = Split.init();
  Split get split => _split;

  List<CalcResult?> _calcResults = [];
  List<CalcResult?> get calcResults => _calcResults;

  ///割り勘情報設定
  void setSplit(Split split) {
    _split = split;
    _calcResults = UtilLogic.calcSplit(split);
  }

  ///割り勘精算ダイアログ表示
  void showSettleDialog(BuildContext context) {
    DialogHelper.showSettleDialog(context: context, onPressed: settleSplit);
  }

  ///CalcInput画面へ遷移
  void pushCalcInput(BuildContext context) {
    final vm = context.read<CalcInputViewModel>();
    //編集状態に設定
    vm.setInputMode(InputMode.edit);
    //編集対象のメモ情報を設定
    vm.setSplit(_split);
    Navigator.push(context, CalcInputScreen.route());
  }

  ///割り勘精算
  void settleSplit() {
    calcRepository.settleSplit(split);
  }

  ///ページスクロール処理
  void scrollPage(int index, PageController controller) {
    controller.animateToPage(index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn);
  }
}
