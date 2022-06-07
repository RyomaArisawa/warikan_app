import 'package:flutter/material.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/components/common/cutom_app_bar.dart';
import 'package:warikan_app/ui/components/common/style/body_background.dart';
import 'package:warikan_app/ui/components/profile/profile_image.dart';

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
      appBar: const CustomAppBar(
        title: ScreenLabels.profile,
      ),
      body: BodyBackground(
        child: Column(
          children: [
            ProfileImage(),
          ],
        ),
      ),
    );
  }
}
