import 'package:flutter/material.dart';
import 'package:warikan_app/data/consts/animations.dart';
import 'package:warikan_app/data/models/memo.dart';
import 'package:warikan_app/ui/views/screens/memo_input_screen.dart';

class MemoOverviewViewModel with ChangeNotifier {
  List<Memo> _memoList = [
    Memo.init(),
    Memo.init(),
    Memo.init(),
    Memo.init(),
    Memo.init(),
    Memo.init(),
    Memo.init(),
    Memo.init(),
    Memo.init(),
    Memo.init(),
  ];

  List<Memo> get memoList => _memoList;

  bool _isLongPressed = false;
  bool get isLongPressed => _isLongPressed;

  pushMemoInput(BuildContext context) {
    Navigator.push(
      context,
      MemoInputScreen.route(),
    );
  }

  pushMemoDetail(BuildContext context, int index) {}

  //長押しされたかを判定するフラグを設定
  void setLongPressed() {
    _isLongPressed = !_isLongPressed;
    notifyListeners();
  }

  //メモを削除
  void deleteMemo(int memoIndex) async {
    //画面からフェードアウトさせる
    _memoList[memoIndex].visible = false;
    notifyListeners();

    //フェードアウトするまで処理を300ミリ秒待たせる
    await Future.delayed(
      Durations.fadeDuration,
    );

    //リストからデータを削除し、再描画
    _memoList.removeAt(memoIndex);
    notifyListeners();
  }
}
