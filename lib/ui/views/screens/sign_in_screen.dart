import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/consts/custom_colors.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/components/common/link_text.dart';
import 'package:warikan_app/ui/components/sign_in/sign_in_form.dart';
import 'package:warikan_app/ui/viewmodels/sign_in_viewmodel.dart';

class SignInScreen extends StatelessWidget {
  /// Sign In 画面
  const SignInScreen({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const SignInScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.read<SignInViewModel>();
    return Scaffold(
      backgroundColor: CustomColors.darkBlue,
      appBar: AppBar(
        backgroundColor: CustomColors.darkBlue,
        title: const Text(ScreenLabels.signIn),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: const [
                    Text(
                      DisplayTexts.signInAppTitle,
                      style: TextStyle(fontSize: 48, color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        DisplayTexts.signInDescription,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              const SignInForm(),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    LinkText(
                        plainText: LinkTexts.forgetPass,
                        linkText: LinkTexts.resetPassLink,
                        onTap: () => vm.resetPassword(context)),
                    LinkText(
                        plainText: LinkTexts.createAccount,
                        linkText: LinkTexts.signUpLink,
                        onTap: () => vm.pushSignUp(context)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
