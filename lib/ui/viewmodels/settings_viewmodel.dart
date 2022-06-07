import 'package:flutter/material.dart';
import 'package:warikan_app/ui/views/screens/profile_screen.dart';

class SettingsViewModel with ChangeNotifier {
  void pushProfile(BuildContext context) {
    Navigator.push(context, ProfileScreen.route());
  }
}
