import 'package:flutter/material.dart';
import 'package:warikan_app/data/models/member.dart';
import 'package:warikan_app/data/models/payment_info.dart';

class CalcInputViewModel with ChangeNotifier {
  //合計金額
  int _totalAmount = 0;
  int get totalAmount => _totalAmount;

  //割り勘対象メンバー
  final List<Member> _members = [
    Member(
      name: "",
      paymentInfoList: [
        PaymentInfo(
          title: "",
          amountOfMoney: "",
        ),
      ],
    ),
  ];
  List<Member> get members => _members;

  //新規メンバー追加
  void addMember() {
    _members.add(
      Member(
        name: "",
        paymentInfoList: [
          PaymentInfo(
            title: "",
            amountOfMoney: "",
          ),
        ],
      ),
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
    _members[memberIndex]
        .paymentInfoList
        .add(PaymentInfo(title: "", amountOfMoney: ""));
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
  void inputAmount(String amountOfMoney, int memberIndex, int paymentIndex) {
    _members[memberIndex].paymentInfoList[paymentIndex].amountOfMoney =
        amountOfMoney;
  }

  //合計金額
  void calcTotalAmount() {
    var total = 0;
    _members.forEach(
      (member) {
        member.paymentInfoList.forEach(
          (paymentInfo) {
            if (paymentInfo.amountOfMoney.isNotEmpty) {
              total = total + int.parse(paymentInfo.amountOfMoney);
            }
          },
        );
      },
    );
    _totalAmount = total;
    notifyListeners();
  }
}
