import 'package:uuid/uuid.dart';
import 'package:split/data/db/calc_dao.dart';
import 'package:split/data/models/member.dart';
import 'package:split/data/models/payment.dart';
import 'package:split/data/models/split.dart';
import 'package:split/data/util/util_logic.dart';

class CalcRepository {
  CalcRepository({required this.calcDao});
  final CalcDao calcDao;

  ///割り勘データ登録
  Future<void> insertSplit({
    required String title,
    required List<Member> members,
    required String uid,
  }) async {
    //支払い項目名のないpaymentは登録しない
    var filteredMembers = <Member>[];
    for (var member in members) {
      var filteredPayments =
          member.payments.where((payment) => payment.item.isNotEmpty).toList();
      filteredMembers.add(member.copyWith(payments: filteredPayments));
    }

    final split = Split(
      id: Uuid().v4(),
      uid: uid,
      title: title,
      members: filteredMembers,
      createdAt: DateTime.now(),
      totalCost: UtilLogic.calcTotalCost(members),
      isSettled: false,
    );

    await calcDao.insertSplit(split);
  }

  ///割り勘情報取得
  Future<List<Split>> getSplitsByUserId(String uid) async {
    /*
    割り勘情報ループ処理
    */
    var splits = <Split>[];
    final splitData = await calcDao.getSplitsByUserId(uid);
    for (var splitDatum in splitData) {
      /*
      メンバー勘情報ループ処理
      */
      var members = <Member>[];
      final memberData = await calcDao.getMembers(splitDatum.data()["id"]);
      for (var memberDatum in memberData) {
        /*
        支払い勘情報ループ処理
        */
        var payments = <Payment>[];
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
        //支払額で降順ソート
        UtilLogic.sortCostDesc(payments);

        //DBから取得した情報をmemberクラスへ変換
        final member = Member(
          memberId: memberDatum.data()["memberId"],
          name: memberDatum.data()["name"],
          payments: payments,
        );
        members.add(member);
      }
      //名前で昇順ソート
      UtilLogic.sortNameAsc(members);

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
    //日付で降順ソート
    UtilLogic.sortDateDesc(splits);
    return splits;
  }

  ///割り勘情報削除
  Future<void> deleteSplit(Split split) async {
    await calcDao.deleteSplit(split);
  }

  ///割り勘情報
  Future<void> updateSplit({
    required Split split,
    required String title,
    required List<Member> members,
  }) async {
    //古い情報を削除
    await calcDao.deleteSplit(split);

    final updatedSplit = split.copyWith(
      title: title,
      members: members,
      totalCost: UtilLogic.calcTotalCost(members),
    );

    //更新後割り勘情報を登録
    await calcDao.insertSplit(updatedSplit);
  }

  ///割り勘精算
  Future<void> settleSplit(Split split) async {
    //精算済みに変更
    final settledSplit = split.copyWith(isSettled: true);
    await calcDao.updateOnlySplit(settledSplit);
  }
}
