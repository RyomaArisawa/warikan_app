import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:warikan_app/data/models/split.dart';

class CalcDao {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  ///割り勘情報登録
  Future<void> insertSplit(Split split) async {
    //Firestoreバッチ処理のインスタンス作成
    var batch = _db.batch();
    //splitへの参照
    var splitRef = _db.collection("splits").doc(split.id);
    //割り勘情報登録
    batch.set(splitRef, split.toMap());

    for (var member in split.members) {
      //メンバーへの参照(splitsのサブコレクション)
      var membersRef = _db
          .collection("splits")
          .doc(split.id)
          .collection("members")
          .doc(member.memberId);
      //メンバー情報登録
      batch.set(membersRef, member.toMap());

      for (var payment in member.paymentList) {
        //支払い情報への参照(membersのサブコレクション)
        var paymentRef = _db
            .collection("splits")
            .doc(split.id)
            .collection("members")
            .doc(member.memberId)
            .collection("payments")
            .doc(payment.paymentId);
        //支払い情報登録
        batch.set(paymentRef, payment.toMap());
      }
    }

    //一連のデータ登録処理をコミット
    await batch.commit();
  }
}
