import 'package:flutter/material.dart';
import 'package:warikan_app/data/consts/error_messages.dart';
import 'package:warikan_app/ui/views/screens/home_screen.dart';
import 'package:warikan_app/ui/views/screens/sign_up_screen.dart';

class SignInViewModel with ChangeNotifier {
  String _email = "";
  String _pass = "";

  String get email => _email;

  String get pass => _pass;

  void inputEmail(String email) {
    _email = email;
  }

  void inputPass(String pass) {
    _pass = pass;
  }

  String? emailValidator(String? email) {
    return email == null || email.isEmpty
        ? "Email Address ${ValidationError.blank}"
        : null;
  }

  String? passValidator(String? pass) {
    return pass == null || pass.isEmpty
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

  void pushSignUp(BuildContext context) {
    Navigator.pushReplacement(
      context,
      SignUpScreen.route(),
    );
  }

  void resetPassword(BuildContext context) {
    // Navigator.push(
    //   context,
    //   SignUpScreen.route(),
    // );
  }
}
