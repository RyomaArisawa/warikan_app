import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split/data/consts/animations.dart';
import 'package:split/data/consts/enum.dart';
import 'package:split/data/models/memo.dart';
import 'package:split/data/repositories/auth_repository.dart';
import 'package:split/data/repositories/memo_repository.dart';
import 'package:split/ui/viewmodels/memo_detail_viewmodel.dart';
import 'package:split/ui/viewmodels/memo_input_viewmodel.dart';
import 'package:split/ui/views/screens/memo_detail_screen.dart';
import 'package:split/ui/views/screens/memo_input_screen.dart';

class MemoOverviewViewModel with ChangeNotifier {
  MemoOverviewViewModel(
      {required this.authRepository, required this.memoRepository});
  final AuthRepository authRepository;
  final MemoRepository memoRepository;

  List<Memo> _memos = [];
  List<Memo> get memos => _memos;

  bool _isLongPressed = false;
  bool get isLongPressed => _isLongPressed;

  ///メモ情報取得
  Future<void> getMemoByUserId() async {
    _memos =
        await memoRepository.getMemoByUserId(authRepository.currentUser!.id);
    notifyListeners();
  }

  ///Memo Input画面へ遷移
  pushMemoInput(BuildContext context) {
    final vm = context.read<MemoInputViewModel>();
    //新規作成状態を設定
    vm.setInputMode(InputMode.create);
    Navigator.push(
      context,
      MemoInputScreen.route(),
    );
  }

  ///Memo Detail画面へ遷移
  pushMemoDetail(BuildContext context, int index) {
    //MemoDetailViewModelへメモ情報を設定
    final vm = context.read<MemoDetailViewModel>();
    vm.setMemo(_memos[index]);
    //Memo Detail画面へプッシュ
    Navigator.push(context, MemoDetailScreen.route());
  }

  ///長押しされたかを判定するフラグを設定
  void setLongPressed() {
    _isLongPressed = !_isLongPressed;
    notifyListeners();
  }

  ///メモ削除
  void deleteMemo(int memoIndex) async {
    //DBからメモ情報削除
    memoRepository.deleteMemo(_memos[memoIndex]);

    //画面からフェードアウトさせる
    _memos[memoIndex].visible = false;
    notifyListeners();

    //フェードアウトするまで処理を300ミリ秒待たせる
    await Future.delayed(
      Durations.fadeDuration,
    );

    //リストからデータを削除し、再描画
    _memos.removeAt(memoIndex);
    if (_memos.isEmpty) {
      _isLongPressed = false;
    }
    notifyListeners();
  }
}
