import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:warikan_app/data/consts/error_messages.dart';
import 'package:warikan_app/data/models/member.dart';
import 'package:warikan_app/data/models/payment.dart';

import '../../data/consts/animations.dart';
import '../../data/consts/texts.dart';
import '../components/common/custom_dialog.dart';
import '../components/common/custom_toast.dart';

class CalcInputViewModel with ChangeNotifier {
  ///タイトル
  String _title = "";
  String get title => _title;

  ///メンバー名
  String _memberName = "";
  String get memberName => _memberName;

  ///割り勘対象メンバー
  final List<Member> _members = [];
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
      Member(name: _memberName, costPerMember: 0, paymentList: []),
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
    _members[memberIndex].paymentList.add(
          Payment.init(),
        );
    notifyListeners();
  }

  ///支払い情報削除
  void deletePayment(int memberIndex, int paymentIndex) {
    _members[memberIndex].paymentList.removeAt(paymentIndex);
    notifyListeners();
  }

  ///支払い項目名入力
  void inputPaymentItem(String item, int memberIndex, int paymentIndex) {
    _members[memberIndex].paymentList[paymentIndex].item = item;
  }

  ///金額入力
  void inputCost(String cost, int memberIndex, int paymentIndex) {
    if (cost.isNotEmpty) {
      _members[memberIndex].paymentList[paymentIndex].cost = int.parse(cost);
    }
  }

  ///タイトル入力
  void inputTitle(String title) {
    _title = title;
  }

  ///保存ダイアログ表示
  showSaveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => CustomDialog(
        title: DialogTexts.titleCompleteDialog,
        content: TextField(
          decoration: const InputDecoration(
            hintText: FormLabels.splitTitle,
          ),
          onChanged: inputTitle,
        ),
        primaryText: ButtonLabels.save,
        secondaryText: ButtonLabels.cancel,
        onPressed: () {},
      ),
    );
  }
}
