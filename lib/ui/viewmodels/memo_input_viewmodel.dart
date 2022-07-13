import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/src/widgets/controller.dart';
import 'package:split/data/consts/enum.dart';
import 'package:split/data/models/memo.dart';
import 'package:split/data/repositories/auth_repository.dart';
import 'package:split/data/repositories/memo_repository.dart';
import 'package:split/data/util/validator.dart';
import 'package:split/ui/views/screens/memo_overview_screen.dart';

class MemoInputViewModel with ChangeNotifier {
  MemoInputViewModel({
    required this.authRepository,
    required this.memoRepository,
  });
  AuthRepository authRepository;
  MemoRepository memoRepository;

  ///新規作成 OR 編集
  InputMode _inputMode = InputMode.create;
  InputMode get inputMode => _inputMode;

  ///メモ情報
  Memo? _memo;
  Memo? get memo => _memo;

  ///タイトル
  String _title = "";
  String get title => _title;

  ///toolbarが表示されているかを判別する
  bool _isShowToolbar = false;
  bool get isShowToolbar => _isShowToolbar;

  ///toolbarを表示する矢印アイコンの向きを制御
  double _turns = 0.0;
  double get turns => _turns;

  ///タイトル入力
  void inputTitle(String title) {
    _title = title;
  }

  ///編集画面の時に編集対象のメモ情報を設定
  void setMemo(Memo memo) {
    _memo = memo;
  }

  ///画面遷移時に新規作成か編集かの状態を設定
  void setInputMode(InputMode inputMode) {
    _inputMode = inputMode;
  }

  ///toolbarの表示・非表示を切り替え
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

  ///メモを保存
  void saveMemo(BuildContext context, GlobalKey<FormState> globalKey,
      QuillController quillController) async {
    if (globalKey.currentState!.validate()) {
      //Flutter Quillの情報をStringに変換
      final content = jsonEncode(quillController.document.toDelta().toJson());

      if (_inputMode == InputMode.create) {
        //新規登録の場合DBに追加
        await memoRepository.insertMemo(
          title: _title,
          content: content,
          user: authRepository.currentUser!,
        );
      } else {
        //編集の場合アップデート
        await memoRepository.updateMemo(
            title: _title, content: content, memo: _memo!);
      }

      _stateClear();

      //MemoOverview画面へ遷移（過去スタックした画面を破棄）
      Navigator.pushAndRemoveUntil(
        context,
        MemoOverviewScreen.route(),
        (_) => false,
      );
    }
  }

  /// validator
  String? titleValidator(String? title) {
    return Validator.titleValidator(title);
  }

  ///状態変数を初期化
  void _stateClear() {
    _memo = null;
    _title = "";
    _isShowToolbar = false;
    _turns = 0.0;
  }
}
