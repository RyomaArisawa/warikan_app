import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class MemoInputViewModel with ChangeNotifier {
  final QuillController _controller = QuillController.basic();
  QuillController get controller => _controller;

  //toolbarが表示されているかを判別する
  bool _isShowToolbar = false;
  bool get isShowToolbar => _isShowToolbar;

  //toolbarを表示する矢印アイコンの向きを制御
  double _turns = 0.0;
  double get turns => _turns;

  //toolbarの表示・非表示を切り替え
  void showToolbar(AnimationController animationController) {
    _isShowToolbar = !_isShowToolbar;

    if (_isShowToolbar) {
      //表示アニメーションの実行
      animationController.forward();
      //アイコンの向きを反転
      _turns += 0.5;
    } else {
      //非表示アニメーションの実行
      animationController.reverse();
      //アイコンの向きを元に戻す
      _turns -= 0.5;
    }
    notifyListeners();
  }
}
