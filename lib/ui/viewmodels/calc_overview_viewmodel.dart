import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split/data/consts/animations.dart';
import 'package:split/data/consts/enum.dart';
import 'package:split/data/models/split.dart';
import 'package:split/data/repositories/auth_repository.dart';
import 'package:split/data/repositories/calc_repository.dart';
import 'package:split/data/util/util_logic.dart';
import 'package:split/ui/viewmodels/calc_detail_viewmodel.dart';
import 'package:split/ui/viewmodels/calc_input_viewmodel.dart';
import 'package:split/ui/views/screens/calc_detail_screen.dart';
import 'package:split/ui/views/screens/calc_input_screen.dart';

class CalcOverviewViewModel with ChangeNotifier {
  CalcOverviewViewModel(
      {required this.authRepository, required this.calcRepository});
  AuthRepository authRepository;
  CalcRepository calcRepository;

  List<Split> _splits = [];
  List<Split> get splits => _splits;

  bool _isLongPressed = false;
  bool get isLongPressed => _isLongPressed;

  ///割り勘情報取得
  Future<void> getSplitsByUserId() async {
    _splits =
        await calcRepository.getSplitsByUserId(authRepository.currentUser!.id);
    notifyListeners();
  }

  ///割り勘情報削除
  void deleteSplit(int splitIndex) async {
    //DBから削除
    calcRepository.deleteSplit(_splits[splitIndex]);

    //画面からフェードアウトさせる
    _splits[splitIndex].visible = false;
    notifyListeners();

    //フェードアウトするまで処理を300ミリ秒待たせる
    await Future.delayed(
      Durations.fadeDuration,
    );

    //リストからデータを削除し、再描画
    _splits.removeAt(splitIndex);

    //割り勘情報が全て削除された場合長押し状態をOFFにする
    if (_splits.isEmpty) {
      _isLongPressed = false;
    }

    notifyListeners();
  }

  ///長押しされたかを判定するフラグを設定
  void setLongPressed() {
    _isLongPressed = !_isLongPressed;
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
    final vm = context.read<CalcInputViewModel>();
    //画面遷移時にState初期化
    vm.stateClear();

    Navigator.push(
      context,
      CalcInputScreen.route(),
    );
  }

  ///ソート処理
  void sortSelected(SortOption value) {
    switch (value) {
      case SortOption.date:
        UtilLogic.sortDateDesc(_splits);
        break;
      case SortOption.isSettle:
        UtilLogic.sortIsSettle(_splits);
        break;
    }
    notifyListeners();
  }
}
