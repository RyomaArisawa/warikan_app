import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/consts/custom_colors.dart';
import 'package:warikan_app/data/consts/screens.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/components/common/link_text.dart';
import 'package:warikan_app/ui/components/sign_up/sign_up_form.dart';
import 'package:warikan_app/ui/viewmodels/sign_up_viewmodel.dart';

class SignUpScreen extends StatelessWidget {
  /// Sign Up 画面
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.read<SignUpViewModel>();
    return Scaffold(
      backgroundColor: CustomColors.darkBlue,
      appBar: AppBar(
        title: const Text(ScreenNames.signUp),
        backgroundColor: CustomColors.darkBlue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SignUpForm(),
            const SizedBox(
              height: 100,
            ),
            LinkText(
              plainText: LinkTexts.askAccount,
              linkText: LinkTexts.signInLink,
              onTap: () => vm.pushSignIn(context),
            ),
          ],
        ),
      ),
    );
  }
}
