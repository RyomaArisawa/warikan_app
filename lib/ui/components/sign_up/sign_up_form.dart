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

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 400),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Form(
          key: _globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InputLabel(label: FormLabels.name),
              InputField(
                onChanged: vm.inputName,
                validator: vm.nameValidator,
              ),
              const InputLabel(label: FormLabels.email),
              InputField(
                onChanged: vm.inputEmail,
                validator: vm.emailValidator,
              ),
              const InputLabel(label: FormLabels.pass),
              InputField(
                onChanged: vm.inputPass,
                validator: vm.passValidator,
              ),
              WideButton(
                text: ButtonLabels.signUp,
                onPressed: () => vm.executeValidator(context, _globalKey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
