import 'package:uuid/uuid.dart';
import 'package:warikan_app/data/db/calc_dao.dart';
import 'package:warikan_app/data/models/member.dart';
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
    members.forEach(
      (member) {
        member.paymentList.forEach(
          (payment) {
            totalCost = totalCost + payment.cost;
          },
        );
      },
    );

    final split = Split(
      id: Uuid().v4(),
      uid: uid,
      title: title,
      members: members,
      cratedAt: DateTime.now(),
      totalCost: totalCost,
      isSettled: false,
    );

    await calcDao.insertSplit(split);
  }
}
