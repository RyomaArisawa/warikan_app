import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:split/data/consts/animations.dart';
import 'package:split/data/repositories/auth_repository.dart';
import 'package:split/data/util/validator.dart';
import 'package:split/ui/components/common/custom_toast.dart';
import 'package:split/ui/views/screens/sign_in_screen.dart';

class ProfileViewModel with ChangeNotifier {
  ProfileViewModel({required this.authRepository});
  AuthRepository authRepository;

  String _name = "";
  String get name => _name;

  String _pass = "";
  String get pass => _pass;

  void inputName(String name) {
    _name = name;
  }

  void inputPass(String pass) {
    _pass = pass;
  }

  /// validator
  String? nameValidator(String? name) {
    return Validator.nameValidator(name);
  }

  String? passValidator(String? pass) {
    return Validator.passValidator(pass);
  }

  ///ユーザー情報更新
  Future<void> changeProfile(
      BuildContext context, GlobalKey<FormState> globalKey) async {
    try {
      //バリデーションを実行
      if (globalKey.currentState!.validate()) {
        //サインアップを実行
        await authRepository.changeProfile(_name, _pass);

        //Home画面へ遷移
        Navigator.of(context, rootNavigator: true)
            .pushAndRemoveUntil(SignInScreen.route(), (route) => false);
      }
    } on String catch (errorMsg) {
      //ユーザ情報の変更が失敗した場合Toastで通知
      final fToast = FToast();
      fToast.init(context);

      fToast.showToast(
        child: CustomToast(msg: errorMsg),
        toastDuration: Durations.toastDuration,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
