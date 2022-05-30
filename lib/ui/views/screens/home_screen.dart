import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/consts/custom_colors.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/viewmodels/home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
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
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppBarTitles.home),
          backgroundColor: CustomColors.darkBlue,
          centerTitle: true,
        ),
        body: vm.screens[vm.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: CustomColors.indigo,
          selectedItemColor: Colors.white,
          backgroundColor: CustomColors.darkBlue,
          currentIndex: vm.currentIndex,
          onTap: vm.setCurrentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate_outlined),
              label: NavigationLabels.calc,
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.document),
              label: NavigationLabels.memo,
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.setting),
              label: NavigationLabels.settings,
            ),
          ],
        ),
      ),
    );
  }
}
