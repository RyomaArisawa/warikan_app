import 'package:flutter/material.dart';
import 'package:split/data/consts/custom_colors.dart';
import 'package:split/data/consts/texts.dart';
import 'package:split/ui/components/profile/profile_form.dart';

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
    return Scaffold(
      backgroundColor: CustomColors.darkBlue,
      appBar: AppBar(
        title: const Text(ScreenLabels.profile),
        backgroundColor: CustomColors.darkBlue,
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: ProfileForm(),
        ),
      ),
    );
  }
}
