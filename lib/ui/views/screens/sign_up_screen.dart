import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split/data/consts/custom_colors.dart';
import 'package:split/data/consts/texts.dart';
import 'package:split/ui/components/common/link_text.dart';
import 'package:split/ui/components/sign_up/sign_up_form.dart';
import 'package:split/ui/viewmodels/sign_up_viewmodel.dart';

class SignUpScreen extends StatelessWidget {
  /// Sign Up 画面
  const SignUpScreen({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const SignUpScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.read<SignUpViewModel>();
    return Scaffold(
      backgroundColor: CustomColors.darkBlue,
      appBar: AppBar(
        title: const Text(ScreenLabels.signUp),
        backgroundColor: CustomColors.darkBlue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
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
      ),
    );
  }
}
