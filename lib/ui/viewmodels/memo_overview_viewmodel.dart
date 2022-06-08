import 'package:flutter/material.dart';
import 'package:warikan_app/data/models/memo.dart';
import 'package:warikan_app/ui/views/screens/memo_input_screen.dart';

class MemoOverviewViewModel with ChangeNotifier {
  List<Map<String, dynamic>> _memoList = [
    {"visible": true, "memo": Memo.init()},
    {"visible": true, "memo": Memo.init()},
    {"visible": true, "memo": Memo.init()},
    {"visible": true, "memo": Memo.init()},
    {"visible": true, "memo": Memo.init()},
    {"visible": true, "memo": Memo.init()},
    {"visible": true, "memo": Memo.init()},
    {"visible": true, "memo": Memo.init()},
    {"visible": true, "memo": Memo.init()},
  ];

  List<Map<String, dynamic>> get memoList => _memoList;

  bool _isLongPressed = false;
  bool get isLongPressed => _isLongPressed;

  pushMemoInput(BuildContext context) {
    Navigator.push(
      context,
      MemoInputScreen.route(),
    );
  }

  pushMemoDetail(BuildContext context, int index) {}

  void setLongPressed() {
    _isLongPressed = !_isLongPressed;
    print(_isLongPressed);
    notifyListeners();
  }

  delete(int memoIndex) async {
    // _memoList.removeAt(memoIndex);
    _memoList[memoIndex]["visible"] = false;
    notifyListeners();

    //フェードアウトするまで処理を300ミリ秒待たせる
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    _memoList.removeAt(memoIndex);
    notifyListeners();
  }
}
