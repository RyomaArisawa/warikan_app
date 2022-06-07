import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/components/common/cutom_app_bar.dart';
import 'package:warikan_app/ui/components/common/style/body_background.dart';
import 'package:warikan_app/ui/components/common/wide_button.dart';
import 'package:warikan_app/ui/components/profile/profile_form.dart';
import 'package:warikan_app/ui/components/profile/profile_image.dart';
import 'package:warikan_app/ui/viewmodels/profile_viewmodel.dart';

class ProfileScreen extends StatelessWidget {
  ///Profile画面
  const ProfileScreen({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.read<ProfileViewModel>();

    return Scaffold(
      appBar: const CustomAppBar(
        title: ScreenLabels.profile,
      ),
      body: BodyBackground(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 500,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const ProfileImage(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Expanded(
                    child: ProfileForm(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  WideButton(
                    text: ButtonLabels.save,
                    height: 40,
                    onPressed: () => vm.showSaveDialog(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
