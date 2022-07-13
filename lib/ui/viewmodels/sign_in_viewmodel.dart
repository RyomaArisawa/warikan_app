import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:split/data/consts/animations.dart';
import 'package:split/data/repositories/auth_repository.dart';
import 'package:split/data/util/dialog_helper.dart';
import 'package:split/data/util/validator.dart';
import 'package:split/ui/components/common/custom_toast.dart';
import 'package:split/ui/views/screens/home_screen.dart';
import 'package:split/ui/views/screens/sign_up_screen.dart';

class SignInViewModel with ChangeNotifier {
  SignInViewModel({required this.authRepository});
  final AuthRepository authRepository;

  String _email = "";
  String get email => _email;

  String _pass = "";
  String get pass => _pass;

  void inputEmail(String email) {
    _email = email;
  }

  void inputPass(String pass) {
    _pass = pass;
  }

  String? emailValidator(String? email) {
    return Validator.emailValidator(email);
  }

  String? passValidator(String? pass) {
    return Validator.passValidator(pass);
  }

  void signIn(BuildContext context, GlobalKey<FormState> globalKey) async {
    try {
      //バリデーションの実行
      if (globalKey.currentState!.validate()) {
        //サインインの実行
        await authRepository.signIn(email, pass);

        //Home画面へ遷移
        Navigator.pushReplacement(
          context,
          HomeScreen.route(),
        );
      }
    } on String catch (errorMsg) {
      //サインインが失敗した場合Toastで通知
      final fToast = FToast();
      fToast.init(context);

      fToast.showToast(
        child: CustomToast(msg: errorMsg),
        toastDuration: Durations.toastDuration,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  void pushSignUp(BuildContext context) {
    Navigator.pushReplacement(
      context,
      SignUpScreen.route(),
    );
  }

  ///保存ダイアログ表示
  showSaveDialog(BuildContext context) {
    DialogHelper.showResetPasswordDialog(
      context: context,
      formFunction: inputEmail,
      sendFunction: () => resetPassword(context),
    );
  }

  ///パスワードリセット
  Future<void> resetPassword(BuildContext context) async {
    await authRepository.resetPassword(_email);
  }
}
