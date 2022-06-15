import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:warikan_app/data/consts/error_messages.dart';
import 'package:warikan_app/data/db/user_dao.dart';
import 'package:warikan_app/data/models/user.dart';

class AuthRepository {
  AuthRepository({required this.userDao});
  final UserDao userDao;
  final _firebaseAuth = firebase.FirebaseAuth.instance;
  //現在のユーザー
  User? currentUser;

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
        currentUser = await userDao.getUserById(userCredential.user!.uid);
      }
    } catch (error) {
      String errorMsg;
      if (error.toString().contains("wrong-password")) {
        errorMsg = AuthError.wrongPass;
      } else if (error.toString().contains("user-not-found")) {
        errorMsg = AuthError.notFound;
      } else {
        errorMsg = AuthError.other;
      }
      throw errorMsg;
    }
  }

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
      currentUser = user;
    } catch (error) {
      String errorMsg;
      if (error.toString().contains("email-already-in-use")) {
        errorMsg = AuthError.alreadyUsed;
      } else {
        errorMsg = AuthError.other;
      }
      throw errorMsg;
    }
  }
}
