import 'package:flutter/material.dart';
import 'package:warikan_app/data/repositories/auth_repository.dart';
import 'package:warikan_app/ui/views/screens/sign_in_screen.dart';

class SettingsViewModel with ChangeNotifier {
  SettingsViewModel({required this.authRepository});
  AuthRepository authRepository;

  // void pushProfile(BuildContext context) {
  //   Navigator.push(context, ProfileScreen.route());
  // }

  void signOut(BuildContext context) async {
    await authRepository.signOut();
    Navigator.of(context, rootNavigator: true)
        .pushAndRemoveUntil(SignInScreen.route(), (route) => false);
  }
}
