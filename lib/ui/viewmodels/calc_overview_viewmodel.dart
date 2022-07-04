import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/models/split.dart';
import 'package:warikan_app/data/repositories/auth_repository.dart';
import 'package:warikan_app/data/repositories/calc_repository.dart';
import 'package:warikan_app/ui/viewmodels/calc_detail_viewmodel.dart';
import 'package:warikan_app/ui/views/screens/calc_detail_screen.dart';
import 'package:warikan_app/ui/views/screens/calc_input_screen.dart';

class CalcOverviewViewModel with ChangeNotifier {
  CalcOverviewViewModel(
      {required this.authRepository, required this.calcRepository});
  AuthRepository authRepository;
  CalcRepository calcRepository;

  List<Split> _splits = [];
  List<Split> get splits => _splits;

  ///割り勘情報取得
  Future<void> getSplitsByUserId() async {
    _splits =
        await calcRepository.getSplitsByUserId(authRepository.currentUser!.id);
    notifyListeners();
  }

  ///CalcDetail画面へ遷移
  void pushCalcDetail(BuildContext context, int pageIndex) {
    //CalcDetail画面で表示する情報をセット
    final vm = context.read<CalcDetailViewModel>();
    vm.setSplit(_splits[pageIndex]);
    Navigator.push(
      context,
      CalcDetailScreen.route(),
    );
  }

  ///CalcInput画面へ遷移
  void pushCalcInput(BuildContext context) {
    Navigator.push(
      context,
      CalcInputScreen.route(),
    );
  }
}
