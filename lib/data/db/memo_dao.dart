import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:split/data/models/memo.dart';

class MemoDao {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  ///メモ情報登録
  Future<void> insertMemo(Memo memo) async {
    await _db.collection("memos").doc(memo.id).set(memo.toMap());
  }

  ///メモ情報更新
  Future<void> updateMemo(Memo memo) async {
    final reference = _db.collection("memos").doc(memo.id);
    await reference.update(memo.toMap());
  }

  ///メモ情報取得
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getMemoByUserId(
      String uid) async {
    final query =
        await _db.collection("memos").where("uid", isEqualTo: uid).get();
    return query.docs;
  }

  ///メモ情報削除
  Future<void> deleteMemo(Memo memo) async {
    await _db.collection("memos").doc(memo.id).delete();
  }
}
