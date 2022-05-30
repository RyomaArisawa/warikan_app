import 'package:flutter/material.dart';
import 'package:warikan_app/ui/views/screens/calc_overview_screen.dart';
import 'package:warikan_app/ui/views/screens/memo_overview_screen.dart';

import '../views/screens/settings_screen.dart';

class HomeViewModel extends ChangeNotifier {
  // ホームで表示する画面
  final List<Widget> screens = const [
    CalcOverviewScreen(),
    MemoOverviewScreen(),
    SettingsScreen(),
  ];

  // 画面のインデックス番号
  int _currentIndex = 0;
  get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
