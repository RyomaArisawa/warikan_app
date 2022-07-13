import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split/data/consts/enum.dart';
import 'package:split/data/models/memo.dart';
import 'package:split/ui/viewmodels/memo_input_viewmodel.dart';
import 'package:split/ui/views/screens/memo_input_screen.dart';

class MemoDetailViewModel with ChangeNotifier {
  late Memo _memo;
  Memo get memo => _memo;

  //MemoDetail画面遷移時にメモ情報を設定
  void setMemo(Memo memo) {
    _memo = memo;
  }

  //MemoInput画面へ遷移（編集）
  void pushMemoInput(BuildContext context) {
    final vm = context.read<MemoInputViewModel>();
    //編集状態に設定
    vm.setInputMode(InputMode.edit);
    //編集対象のメモ情報を設定
    vm.setMemo(memo);
    Navigator.push(context, MemoInputScreen.route());
  }
}
