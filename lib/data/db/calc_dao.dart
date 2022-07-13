import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:split/data/models/split.dart';

class CalcDao {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  ///割り勘情報登録
  Future<void> insertSplit(Split split) async {
    //Firestoreバッチ処理のインスタンス作成
    var batch = _db.batch();
    //splitへの参照
    final splitRef = _db.collection("splits").doc(split.id);
    //割り勘情報登録
    batch.set(splitRef, split.toMap());

    for (var member in split.members) {
      //メンバーへの参照(splitsのサブコレクション)
      final memberRef = _db
          .collection("splits")
          .doc(split.id)
          .collection("members")
          .doc(member.memberId);
      //メンバー情報登録
      batch.set(memberRef, member.toMap());

      for (var payment in member.payments) {
        //支払い情報への参照(membersのサブコレクション)
        final paymentRef = _db
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

  ///割り勘情報取得
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getSplitsByUserId(
      String uid) async {
    final query =
        await _db.collection("splits").where("uid", isEqualTo: uid).get();
    return query.docs;
  }

  ///メンバー取得
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getMembers(
      String splitId) async {
    final query =
        await _db.collection("splits").doc(splitId).collection("members").get();
    return query.docs;
  }

  ///支払い情報取得
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getPayments(
      String splitId, String memberId) async {
    final query = await _db
        .collection("splits")
        .doc(splitId)
        .collection("members")
        .doc(memberId)
        .collection("payments")
        .get();
    return query.docs;
  }

  ///割り勘情報削除
  Future<void> deleteSplit(Split split) async {
    //Firestoreバッチ処理のインスタンス作成
    var batch = _db.batch();
    /*
    割り勘情報削除
    */
    final splitRef = _db.collection("splits").doc(split.id);
    batch.delete(splitRef);
    /*
    メンバー情報削除
    */
    for (var member in split.members) {
      final memberRef = _db
          .collection("splits")
          .doc(split.id)
          .collection("members")
          .doc(member.memberId);
      batch.delete(memberRef);
      /*
      支払い情報削除
      */
      for (var payment in member.payments) {
        //splitへの参照
        final paymentRef = _db
            .collection("splits")
            .doc(split.id)
            .collection("members")
            .doc(member.memberId)
            .collection("payments")
            .doc(payment.paymentId);
        batch.delete(paymentRef);
      }
    }

    //一連のデータ削除処理をコミット
    await batch.commit();
  }

  ///割り勘情報更新（メンバー・支払い項目を除く）
  Future<void> updateOnlySplit(Split split) async {
    await _db.collection("splits").doc(split.id).update(split.toMap());
  }
}
