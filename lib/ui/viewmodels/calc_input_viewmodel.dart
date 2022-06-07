import 'package:flutter/material.dart';
import 'package:warikan_app/data/models/member.dart';
import 'package:warikan_app/data/models/payment_info.dart';

class CalcInputViewModel with ChangeNotifier {
  //合計金額
  int _totalCost = 0;
  int get totalCost => _totalCost;

  //割り勘対象メンバー
  final List<Member> _members = [
    Member.init(),
  ];
  List<Member> get members => _members;

  //新規メンバー追加
  void addMember() {
    _members.add(
      Member.init(),
    );
    notifyListeners();
  }

  //メンバー削除
  void deleteMember(int memberIndex) {
    _members.removeAt(memberIndex);
    notifyListeners();
  }

  //新規支払い情報追加
  void addPayment(int memberIndex) {
    _members[memberIndex].paymentInfoList.add(
          PaymentInfo.init(),
        );
    notifyListeners();
  }

  //支払い情報削除
  void deletePayment(int memberIndex, int paymentIndex) {
    _members[memberIndex].paymentInfoList.removeAt(paymentIndex);
    notifyListeners();
  }

  //メンバー名入力
  void inputMemberName(String name, int memberIndex) {
    _members[memberIndex].name = name;
  }

  //支払い項目名入力
  void inputTittle(String title, int memberIndex, int paymentIndex) {
    _members[memberIndex].paymentInfoList[paymentIndex].title = title;
  }

  //金額入力
  void inputCost(String cost, int memberIndex, int paymentIndex) {
    if (cost.isNotEmpty) {
      _members[memberIndex].paymentInfoList[paymentIndex].cost =
          int.parse(cost);
    }
  }

  //合計金額
  void calcTotalCost() {
    var total = 0;
    _members.forEach(
      (member) {
        member.paymentInfoList.forEach(
          (paymentInfo) {
            total = total + paymentInfo.cost;
          },
        );
      },
    );
    _totalCost = total;
    notifyListeners();
  }
}
