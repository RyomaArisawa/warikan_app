import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:split/data/consts/custom_colors.dart';
import 'package:split/data/consts/texts.dart';
import 'package:split/ui/viewmodels/home_viewmodel.dart';
import 'package:split/ui/views/screens/calc_overview_screen.dart';
import 'package:split/ui/views/screens/memo_overview_screen.dart';
import 'package:split/ui/views/screens/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  ///ホーム画面（BottomNavigationBar固定画面）
  const HomeScreen({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    return SafeArea(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          height: 60,
          activeColor: Colors.white,
          inactiveColor: CustomColors.indigo,
          backgroundColor: CustomColors.darkBlue,
          currentIndex: vm.currentIndex,
          onTap: vm.setCurrentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate_outlined),
              label: ScreenLabels.calc,
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.document),
              label: ScreenLabels.memo,
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.setting),
              label: ScreenLabels.settings,
            ),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(
                    child: CalcOverviewScreen(),
                  );
                },
              );
            case 1:
              return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(
                    child: MemoOverviewScreen(),
                  );
                },
              );
            case 2:
              return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(
                    child: SettingsScreen(),
                  );
                },
              );
            default:
              return const CupertinoTabView();
          }
        },
      ),
    );
  }
}
