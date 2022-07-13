import 'package:flutter/material.dart';
import 'package:split/ui/views/screens/calc_overview_screen.dart';
import 'package:split/ui/views/screens/memo_overview_screen.dart';

import '../../data/consts/texts.dart';
import '../views/screens/settings_screen.dart';

class HomeViewModel with ChangeNotifier {
  // ホームで表示する画面
  final screens = const <Widget>[
    CalcOverviewScreen(),
    MemoOverviewScreen(),
    SettingsScreen(),
  ];

  final appbarTitles = const <String>[
    ScreenLabels.calc,
    ScreenLabels.memo,
    ScreenLabels.settings,
  ];

  // 画面のインデックス番号
  int _currentIndex = 0;
  get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
