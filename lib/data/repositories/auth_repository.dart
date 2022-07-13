import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:split/data/db/user_dao.dart';
import 'package:split/data/models/user.dart';
import 'package:split/data/util/messenger.dart';

class AuthRepository {
  AuthRepository({required this.userDao});
  final UserDao userDao;
  final _firebaseAuth = firebase.FirebaseAuth.instance;

  ///現在のユーザー
  User? _currentUser;
  User? get currentUser => _currentUser;

  ///サインイン
  Future<void> signIn(String email, String password) async {
    try {
      //サインインを実行
      firebase.UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      //ログイン中ユーザーを設定
      if (userCredential.user?.uid != null) {
        //DBからユーザー情報を取得
        User user = await userDao.getUserById(userCredential.user!.uid);
        //リセットされた場合を考慮して、パスワードの更新を行う
        User currentUser = user.copyWith(pass: password);
        await userDao.updateUser(currentUser);
        _currentUser = currentUser;
      }
    } catch (error) {
      throw Messenger.authErrorMsg(error.toString());
    }
  }

  ///サインアップ
  Future<void> signUp(String name, String email, String password) async {
    try {
      //サインアップ実行
      firebase.UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //ユーザークラス生成
      final user = User(
        id: userCredential.user!.uid,
        name: name,
        email: userCredential.user!.email ?? "",
        pass: password,
        photoUrl: userCredential.user!.photoURL ?? "",
      );

      //ユーザーをDB登録
      await userDao.registerUser(user);

      //ログイン中ユーザーを設定
      _currentUser = user;
    } catch (error) {
      throw Messenger.authErrorMsg(error.toString());
    }
  }

  ///サインアウト
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    _currentUser = null;
  }

  ///ユーザー情報変更
  Future<void> changeProfile(String name, String newPass) async {
    await _firebaseAuth.currentUser!.updatePassword(newPass);

    User updatedUser = _currentUser!.copyWith(name: name, pass: newPass);
    //DB登録
    await userDao.updateUser(updatedUser);
    _currentUser = updatedUser;
  }

  ///パスワードリセット
  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
