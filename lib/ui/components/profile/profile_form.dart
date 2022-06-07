import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/components/common/input_field.dart';
import 'package:warikan_app/ui/components/common/input_label.dart';
import 'package:warikan_app/ui/components/common/style/dark_blue_card.dart';
import 'package:warikan_app/ui/viewmodels/profile_viewmodel.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.read<ProfileViewModel>();

    return DarkBlueCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InputLabel(label: FormLabels.name),
          InputField(initialValue: vm.name, onChanged: vm.inputName),
          const InputLabel(label: FormLabels.email),
          InputField(initialValue: vm.email, onChanged: vm.inputEmail),
          const InputLabel(label: FormLabels.pass),
          InputField(initialValue: vm.pass, onChanged: vm.inputPass),
        ],
      ),
    );
  }
}
