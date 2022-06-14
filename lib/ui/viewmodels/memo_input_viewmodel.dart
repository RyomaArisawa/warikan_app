import 'package:flutter/material.dart';
import 'package:warikan_app/data/consts/enum.dart';
import 'package:warikan_app/data/models/memo.dart';

class MemoInputViewModel with ChangeNotifier {
  //新規作成 OR 編集
  InputMode _inputMode = InputMode.create;
  InputMode get inputMode => _inputMode;

  //メモ情報
  Memo? _memo;
  Memo? get memo => _memo;

  //タイトル
  String _title = "";
  String get title => _title;

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

  //タイトル入力
  void inputTitle(String title) {
    _title = title;
  }

  //編集画面の時に編集対象のメモ情報を設定
  void setMemo(Memo memo) {
    _memo = memo;
  }

  //画面遷移時に新規作成か編集かの状態を設定
  void setInputMode(InputMode inputMode) {
    _inputMode = inputMode;
  }
}