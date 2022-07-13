import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:split/data/consts/animations.dart';
import 'package:split/data/repositories/auth_repository.dart';
import 'package:split/data/util/validator.dart';
import 'package:split/ui/components/common/custom_toast.dart';
import 'package:split/ui/views/screens/sign_in_screen.dart';

import '../views/screens/home_screen.dart';

class SignUpViewModel with ChangeNotifier {
  SignUpViewModel({required this.authRepository});
  final AuthRepository authRepository;

  /// 入力フォームの状態変数
  String _name = "";
  String get name => _name;

  String _email = "";
  String get email => _email;

  String _pass = "";
  String get pass => _pass;

  void inputName(String name) {
    _name = name;
  }

  void inputEmail(String email) {
    _email = email;
  }

  void inputPass(String pass) {
    _pass = pass;
  }

  /// validator
  String? nameValidator(String? name) {
    return Validator.nameValidator(name);
  }

  String? emailValidator(String? email) {
    return Validator.emailValidator(email);
  }

  String? passValidator(String? pass) {
    return Validator.passValidator(pass);
  }

  void signUp(BuildContext context, GlobalKey<FormState> globalKey) async {
    try {
      //バリデーションを実行
      if (globalKey.currentState!.validate()) {
        //サインアップを実行
        await authRepository.signUp(_name, _email, _pass);

        //Home画面へ遷移
        Navigator.pushReplacement(
          context,
          HomeScreen.route(),
        );
      }
    } on String catch (errorMsg) {
      //サインアップが失敗した場合Toastで通知
      final fToast = FToast();
      fToast.init(context);

      fToast.showToast(
        child: CustomToast(msg: errorMsg),
        toastDuration: Durations.toastDuration,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  /// Routing
  void pushSignIn(BuildContext context) {
    Navigator.pushReplacement(
      context,
      SignInScreen.route(),
    );
  }
}
