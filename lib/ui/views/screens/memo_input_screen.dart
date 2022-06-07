import 'package:flutter/material.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/components/common/cutom_app_bar.dart';

class MemoInputScreen extends StatelessWidget {
  /// MemoInput画面
  const MemoInputScreen({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const MemoInputScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: ScreenLabels.memo,
      ),
      body: Container(),
    );
  }
}
