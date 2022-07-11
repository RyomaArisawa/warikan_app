import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/components/common/cutom_app_bar.dart';
import 'package:warikan_app/ui/components/common/style/body_background.dart';
import 'package:warikan_app/ui/components/settings/setting_list_card.dart';
import 'package:warikan_app/ui/viewmodels/settings_viewmodel.dart';

class SettingsScreen extends StatelessWidget {
  ///Settings画面
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.read<SettingsViewModel>();
    return Scaffold(
      appBar: const CustomAppBar(
        title: ScreenLabels.settings,
      ),
      body: BodyBackground(
        child: Column(
          children: [
            // SettingListCard(
            //   title: ButtonLabels.profile,
            //   onTap: () => vm.pushProfile(context),
            // ),
            SettingListCard(
              title: ButtonLabels.signOut,
              onTap: () => vm.signOut(context),
            ),
          ],
        ),
      ),
    );
  }
}
