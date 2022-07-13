import 'package:split/data/consts/error_messages.dart';

class Messenger {
  static String authErrorMsg(String error) {
    String errorMsg;
    if (error.toString().contains("wrong-password")) {
      //パスワードが間違えていた場合
      errorMsg = AuthError.wrongPass;
    } else if (error.toString().contains("user-not-found")) {
      //ユーザーが登録されていない場合
      errorMsg = AuthError.notFound;
    } else if (error.toString().contains("email-already-in-use")) {
      //すでに同じメールアドレスでユーザが登録されている場合
      errorMsg = AuthError.alreadyUsed;
    } else {
      //その他エラー
      errorMsg = AuthError.other;
    }
    return errorMsg;
  }
}
