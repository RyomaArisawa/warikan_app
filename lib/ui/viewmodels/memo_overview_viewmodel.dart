import 'package:flutter/material.dart';
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

  void setLongPressed() {
    _isLongPressed = !_isLongPressed;
    print(_isLongPressed);
    notifyListeners();
  }
}
