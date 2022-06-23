import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:warikan_app/data/models/memo.dart';

class MemoDao {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> insertMemo(Memo memo) async {
    await _db.collection("memos").doc(memo.id).set(memo.toMap());
  }

  Future<void> updateMemo(Memo memo) async {
    final reference = _db.collection("memos").doc(memo.id);
    await reference.update(memo.toMap());
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getMemoByUserId(
      String uid) async {
    final query =
        await _db.collection("memos").where("uid", isEqualTo: uid).get();
    return query.docs;
  }
}
