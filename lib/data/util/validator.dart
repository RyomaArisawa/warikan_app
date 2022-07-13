import 'package:email_validator/email_validator.dart';
import 'package:split/data/consts/error_messages.dart';

class Validator {
  //名前のバリデーション
  static String? nameValidator(String? name) {
    //Nullまたは空文字の場合
    if (name == null || name.isEmpty) {
      return "Name ${ValidationError.blank}";
    }

    //20文字以上の場合
    if (name.length > 20) {
      return "Name ${ValidationError.short}";
    }

    //名前が有効
    return null;
  }

  //メールアドレスのバリデーション
  static String? emailValidator(String? email) {
    //Nullまたは空文字の場合
    if (email == null || email.isEmpty) {
      return "Email Address ${ValidationError.blank}";
    }

    //メールアドレスが有効でない場合
    if (!EmailValidator.validate(email)) {
      return "Email Address ${ValidationError.invalid}";
    }

    //メールアドレスが有効
    return null;
  }

  //パスワードのバリデーション
  static String? passValidator(String? pass) {
    //Nullまたは空文字の場合
    if (pass == null || pass.isEmpty) {
      return "Password ${ValidationError.blank}";
    }

    //6文字未満の場合
    if (pass.length < 6) {
      return "Password ${ValidationError.short}";
    }

    //パスワードが半角英数字以外の文字を含む場合
    String pattern = r'^[a-zA-Z0-9]{6,}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(pass)) {
      return "Password ${ValidationError.onlyHalfWidth}";
    }

    //メールアドレスが有効
    return null;
  }

  static String? titleValidator(String? title) {
    return title == null || title.isEmpty
        ? "Title ${ValidationError.blank}"
        : null;
  }
}
