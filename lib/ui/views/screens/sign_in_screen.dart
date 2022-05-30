import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:warikan_app/ui/views/components/textFieldWithHeading.dart';
import 'package:warikan_app/ui/views/components/submit_button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key) {}

  // メールアドレス入力フォームのテキストコントローラー
  final TextEditingController emailController = TextEditingController();

  // パスワード入力フォームのテキストコントローラー
  final TextEditingController passController = TextEditingController();

  // 背景画像との色合いで見にくくなる部分があるので、shadowを使って文字に輪郭を付ける
  final Shadow _textShadow = const Shadow(offset: Offset(0.75, 0.75));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/login_screen_wallpaper.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 40.0,
              left: 20.0,
              right: 20.0,
            ),
            child: DefaultTextStyle.merge(
              style: TextStyle(
                color: Colors.white,
                shadows: <Shadow>[_textShadow],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(
                    height: 100.0,
                  ),
                  Column(
                    children: <Widget>[
                      const Text(
                        "warikan",
                        style: TextStyle(
                            fontSize: 38.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      const Text(
                        "sign up or login to have fun exploring this APP",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(
                        height: 100.0,
                      ),
                      TextFieldWithHeading(
                        headingColor: Colors.white,
                        textEditingController: emailController,
                        heading: "e-mail",
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextFieldWithHeading(
                        headingColor: Colors.white,
                        textEditingController: passController,
                        heading: "password",
                      ),
                      const SizedBox(height: 20.0),
                      SubmitButton(
                        buttonLabel: "sign in",
                        width: double.infinity,
                        onPressed: () => _submitForm(context),
                      ),
                      const SizedBox(height: 10.0),
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(text: "Forget password?  "),
                                    TextSpan(
                                        text: "Reset here",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap =
                                              () => _passwordReset(context)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                        text:
                                            "Do you want to create an account?  "),
                                    TextSpan(
                                      text: "sign up",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap =
                                            () => _showSighUpScreen(context),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm(BuildContext context) {
    List<String> textList = [];
    textList
      ..add(emailController.text)
      ..add(passController.text);
    print(textList);
    print("MenuScreenへ遷移");
//    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MenuScreen()));
  }

  // TODO 認証関連が決まったら対応
  void _passwordReset(BuildContext context) {
    print("authのリセット系のAPIよぶ");
  }

  // TODO 画面遷移を聞いてから
  void _showSighUpScreen(BuildContext context) {
    print("画面遷移");
  }
}
