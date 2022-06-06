import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/models/split_info.dart';
import 'package:warikan_app/ui/viewmodels/calc_detail_viewmodel.dart';
import 'package:warikan_app/ui/views/screens/calc_detail_screen.dart';
import 'package:warikan_app/ui/views/screens/calc_input_screen.dart';

class CalcOverviewViewModel with ChangeNotifier {
  //List<SplitInfo> _splitInfoList = [];
  //TODO
  List<SplitInfo> _splitInfoList = [
    SplitInfo.init(),
    SplitInfo.init(),
    SplitInfo.init(),
    SplitInfo.init(),
    SplitInfo.init(),
  ];
  List<SplitInfo> get splitInfoList => _splitInfoList;

  //CalcDetail画面へ遷移
  void pushCalcDetail(BuildContext context, int pageIndex) {
    //CalcDetail画面で表示する情報をセット
    final vm = context.read<CalcDetailViewModel>();
    vm.setSplitInfo(_splitInfoList[pageIndex]);
    Navigator.push(
      context,
      CalcDetailScreen.route(),
    );
  }

  //CalcInput画面へ遷移
  void pushCalcInput(BuildContext context) {
    Navigator.push(
      context,
      CalcInputScreen.route(),
    );
  }
}
