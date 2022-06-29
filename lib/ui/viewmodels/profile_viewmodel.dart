import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warikan_app/data/consts/error_messages.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/components/common/custom_dialog.dart';

class ProfileViewModel with ChangeNotifier {
  File? _image;
  File? get image => _image;

  String _name = "";
  String get name => _name;

  String _email = "";
  String get email => _email;

  String _pass = "";
  String get pass => _pass;

  void setImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      notifyListeners();
    }
  }

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

  showSaveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => CustomDialog(
        title: DialogTexts.titleProfileDialog,
        content: const Text(DialogTexts.askProfileDialog),
        onPressed: () {},
      ),
    );
  }
}
