import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split/data/consts/texts.dart';
import 'package:split/ui/components/common/custom_button.dart';
import 'package:split/ui/components/common/input_field.dart';
import 'package:split/ui/components/common/input_label.dart';
import 'package:split/ui/viewmodels/profile_viewmodel.dart';

class ProfileForm extends StatelessWidget {
  ///Profile画面のフォームコンポーネント
  const ProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _globalKey = GlobalKey<FormState>();
    final vm = context.read<ProfileViewModel>();

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 300),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: Form(
          key: _globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InputLabel(label: FormLabels.name),
              InputField(
                height: 80,
                onChanged: vm.inputName,
                validator: vm.nameValidator,
              ),
              const InputLabel(label: FormLabels.pass),
              InputField(
                height: 80,
                onChanged: vm.inputPass,
                validator: vm.passValidator,
              ),
              CustomButton(
                text: ButtonLabels.changeProfile,
                onPressed: () => vm.changeProfile(context, _globalKey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
