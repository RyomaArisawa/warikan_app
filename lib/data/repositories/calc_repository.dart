import 'package:uuid/uuid.dart';
import 'package:warikan_app/data/db/calc_dao.dart';
import 'package:warikan_app/data/models/member.dart';
import 'package:warikan_app/data/models/payment.dart';
import 'package:warikan_app/data/models/split.dart';

class CalcRepository {
  CalcRepository({required this.calcDao});
  final CalcDao calcDao;

  ///割り勘データ登録
  Future<void> insertSplit({
    required String title,
    required List<Member> members,
    required String uid,
  }) async {
    //合計金額算出
    var totalCost = 0;
    for (var member in members) {
      for (var payment in member.payments) {
        totalCost = totalCost + payment.cost;
      }
    }

    final split = Split(
      id: Uuid().v4(),
      uid: uid,
      title: title,
      members: members,
      createdAt: DateTime.now(),
      totalCost: totalCost,
      isSettled: false,
    );

    await calcDao.insertSplit(split);
  }

  ///割り勘情報取得
  Future<List<Split>> getSplitsByUserId(String uid) async {
    /*
    割り勘情報ループ処理
    */
    final splits = <Split>[];
    final splitData = await calcDao.getSplitsByUserId(uid);
    for (var splitDatum in splitData) {
      /*
      メンバー勘情報ループ処理
      */
      final members = <Member>[];
      final memberData = await calcDao.getMembers(splitDatum.data()["id"]);
      for (var memberDatum in memberData) {
        /*
        支払い勘情報ループ処理
        */
        final payments = <Payment>[];
        final paymentData = await calcDao.getPayments(
            splitDatum.data()["id"], memberDatum.data()["memberId"]);
        for (var paymentDatum in paymentData) {
          //DBから取得した情報をmemberクラスへ変換
          final payment = Payment(
            paymentId: paymentDatum.data()["paymentId"],
            item: paymentDatum.data()["item"],
            cost: paymentDatum.data()["cost"],
          );
          payments.add(payment);
        }

        //DBから取得した情報をmemberクラスへ変換
        final member = Member(
          memberId: memberDatum.data()["memberId"],
          name: memberDatum.data()["name"],
          payments: payments,
        );
        members.add(member);
      }

      //DBから取得した情報をSplitクラスへ変換
      final split = Split(
        id: splitDatum.data()["id"],
        uid: splitDatum.data()["uid"],
        title: splitDatum.data()["title"],
        members: members,
        createdAt: DateTime.parse(splitDatum.data()["createdAt"] as String),
        totalCost: splitDatum.data()["totalCost"],
        isSettled: splitDatum.data()["isSettled"],
      );

      splits.add(split);
    }
    return splits;
  }

  ///割り勘情報削除
  Future<void> deleteSplit(Split split) async {
    await calcDao.deleteSplit(split);
  }

  Future<void> updateSplit({
    required Split split,
    required String title,
    required List<Member> members,
    required String uid,
  }) async {
    //合計金額算出
    var totalCost = 0;
    for (var member in members) {
      for (var payment in member.payments) {
        totalCost = totalCost + payment.cost;
      }
    }
  }

  Future<void> settleSplit(Split split) async {
    await calcDao.updateSplit(split);
  }
}
