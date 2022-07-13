import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:split/data/models/user.dart';

class UserDao {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  ///ユーザー登録
  Future<void> registerUser(User user) async {
    await _db.collection("users").doc(user.id).set(user.toMap());
  }

  ///IDでのユーザー検索
  Future<User> getUserById(String id) async {
    final result =
        await _db.collection("users").where("id", isEqualTo: id).get();
    return User.fromMap(result.docs[0].data());
  }

  ///ユーザー情報更新
  Future<void> updateUser(User user) async {
    await _db.collection("users").doc(user.id).update(user.toMap());
  }
}
