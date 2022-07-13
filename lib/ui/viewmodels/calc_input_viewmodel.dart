import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';
import 'package:split/data/consts/enum.dart';
import 'package:split/data/consts/error_messages.dart';
import 'package:split/data/models/member.dart';
import 'package:split/data/models/payment.dart';
import 'package:split/data/models/split.dart';
import 'package:split/data/repositories/auth_repository.dart';
import 'package:split/data/repositories/calc_repository.dart';
import 'package:split/data/util/dialog_helper.dart';

import '../../data/consts/animations.dart';
import '../components/common/custom_toast.dart';

class CalcInputViewModel with ChangeNotifier {
  CalcInputViewModel({
    required this.authRepository,
    required this.calcRepository,
  });
  AuthRepository authRepository;
  CalcRepository calcRepository;

  ///新規作成 OR 編集
  InputMode _inputMode = InputMode.create;
  InputMode get inputMode => _inputMode;

  ///割り勘情報(編集モードのみ使用)
  Split? _split;
  Split? get split => _split;

  ///タイトル
  String _title = "";
  String get title => _title;

  ///メンバー名
  String _memberName = "";
  String get memberName => _memberName;

  ///割り勘対象メンバー
  List<Member> _members = [];
  List<Member> get members => _members;

  ///メンバー名入力
  void inputMemberName(String memberName) {
    _memberName = memberName;
  }

  ///新規メンバー追加
  void addMember(BuildContext context) {
    //メンバー名が空、もしくはすでに同じ名前のメンバーが存在する場合は追加しない
    var memberNames = _members.map((member) => member.name);

    if (_memberName.isEmpty || memberNames.contains(_memberName)) {
      var errorMsg = _memberName.isEmpty
          ? "Member Name ${ValidationError.blank}"
          : ValidationError.memberExist;

      //Toastでエラーメッセージを表示
      final fToast = FToast();
      fToast.init(context);
      fToast.showToast(
        child: CustomToast(msg: errorMsg),
        toastDuration: Durations.toastDuration,
        gravity: ToastGravity.BOTTOM,
      );

      return;
    }

    _members.add(
      Member(memberId: Uuid().v4(), name: _memberName, payments: []),
    );

    //メンバー名初期化
    _memberName = "";

    notifyListeners();
  }

  ///メンバー削除
  void deleteMember(int memberIndex) {
    _members.removeAt(memberIndex);
    notifyListeners();
  }

  ///新規支払い情報追加
  void addPayment(int memberIndex) {
    _members[memberIndex].payments.add(
          Payment.init(),
        );
    notifyListeners();
  }

  ///支払い情報削除
  void deletePayment(int memberIndex, int paymentIndex) {
    _members[memberIndex].payments.removeAt(paymentIndex);
    notifyListeners();
  }

  ///支払い項目名入力
  void inputPaymentItem(String item, int memberIndex, int paymentIndex) {
    _members[memberIndex].payments[paymentIndex].item = item;
  }

  ///金額入力
  void inputCost(String cost, int memberIndex, int paymentIndex) {
    if (cost.isNotEmpty) {
      _members[memberIndex].payments[paymentIndex].cost = int.parse(cost);
    }
  }

  ///タイトル入力
  void inputTitle(String title) {
    _title = title;
  }

  ///ページスクロール処理
  void scrollPage(int index, PageController controller) {
    controller.animateToPage(index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn);
  }

  ///保存ダイアログ表示
  showSaveDialog(BuildContext context) {
    DialogHelper.showCalcSaveDialog(
      context: context,
      initialValue: _title,
      formFunction: inputTitle,
      saveFunction: () => saveSplit(context),
    );
  }

  ///割り勘情報保存
  Future<void> saveSplit(BuildContext context) async {
    if (_inputMode == InputMode.create) {
      //新規登録
      await calcRepository.insertSplit(
          title: title, members: members, uid: authRepository.currentUser!.id);
    } else {
      //更新
      await calcRepository.updateSplit(
          split: _split!, title: _title, members: _members);
    }

    //State初期化
    stateClear();
  }

  ///入力モード切り替え
  void setInputMode(InputMode inputMode) {
    _inputMode = inputMode;
  }

  ///編集対象割り勘情報設定
  void setSplit(Split split) {
    _split = split;

    for (var member in split.members) {
      var copiedMember = member.copyWith(payments: [...member.payments]);
      _members.add(copiedMember);
    }

    _title = split.title;
  }

  ///State初期化
  void stateClear() {
    _inputMode = InputMode.create;
    _split = null;
    _title = "";
    _memberName = "";
    _members = [];
  }
}
