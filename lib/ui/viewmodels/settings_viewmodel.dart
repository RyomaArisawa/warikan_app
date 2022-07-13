import 'package:flutter/material.dart';
import 'package:split/data/repositories/auth_repository.dart';
import 'package:split/ui/views/screens/profile_screen.dart';
import 'package:split/ui/views/screens/sign_in_screen.dart';

class SettingsViewModel with ChangeNotifier {
  SettingsViewModel({required this.authRepository});
  AuthRepository authRepository;

  ///プロフィール変更画面へ遷移
  void pushProfile(BuildContext context) {
    Navigator.push(context, ProfileScreen.route());
  }

  ///サインアウト
  void signOut(BuildContext context) async {
    await authRepository.signOut();
    Navigator.of(context, rootNavigator: true)
        .pushAndRemoveUntil(SignInScreen.route(), (route) => false);
  }
}
