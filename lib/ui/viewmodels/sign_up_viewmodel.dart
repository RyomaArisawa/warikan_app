import 'package:flutter/material.dart';
import 'package:warikan_app/data/consts/error_messages.dart';
import 'package:warikan_app/ui/views/screens/sign_in_screen.dart';

import '../views/screens/home_screen.dart';

class SignUpViewModel with ChangeNotifier {
  /// 入力フォームの状態変数
  String _name = "";
  String _email = "";
  String _pass = "";

  String get name => _name;
  String get email => _email;
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
    return name == null || name.isEmpty
        ? "Name ${ValidationError.blank}"
        : null;
  }

  String? emailValidator(String? name) {
    return name == null || name.isEmpty
        ? "Email Address ${ValidationError.blank}"
        : null;
  }

  String? passValidator(String? name) {
    return name == null || name.isEmpty
        ? "Password ${ValidationError.blank}"
        : null;
  }

  void executeValidator(BuildContext context, GlobalKey<FormState> globalKey) {
    if (globalKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        HomeScreen.route(),
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
