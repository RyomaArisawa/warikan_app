import 'package:flutter/material.dart';
import 'package:warikan_app/ui/components/sign_up/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpForm(),
    );
  }
}
