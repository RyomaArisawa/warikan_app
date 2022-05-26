import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/components/common/input_field.dart';
import 'package:warikan_app/ui/components/common/input_label.dart';
import 'package:warikan_app/ui/components/common/wide_button.dart';
import 'package:warikan_app/ui/viewmodels/sign_up_viewmodel.dart';

class SignUpForm extends StatelessWidget {
  /// SignUp画面のフォームコンポーネント
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _globalKey = GlobalKey<FormState>();
    final vm = context.read<SignUpViewModel>();
    return Form(
      key: _globalKey,
      child: Column(
        children: [
          const InputLabel(label: FormLabel.name),
          InputField(
            onChanged: vm.inputName,
            validator: vm.nameValidator,
          ),
          const InputLabel(label: FormLabel.email),
          InputField(
            onChanged: vm.inputEmail,
            validator: vm.emailValidator,
          ),
          const InputLabel(label: FormLabel.pass),
          InputField(
            onChanged: vm.inputPass,
            validator: vm.passValidator,
          ),
          WideButton(
              text: ButtonLabel.signUp,
              onPressed: () => {_globalKey.currentState?.validate()})
        ],
      ),
    );
  }
}
