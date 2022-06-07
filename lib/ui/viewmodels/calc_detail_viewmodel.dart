import 'package:flutter/material.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/data/models/split_info.dart';
import 'package:warikan_app/ui/components/common/custom_dialog.dart';

class CalcDetailViewModel with ChangeNotifier {
  SplitInfo _splitInfo = SplitInfo.init();
  SplitInfo get splitInfo => _splitInfo;

  void setSplitInfo(SplitInfo splitInfo) {
    _splitInfo = splitInfo;
  }

  showCompleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => CustomDialog(
        title: DialogTexts.titleCompleteDialog,
        content: DialogTexts.askCompleteDialog,
        onPressed: () {},
      ),
    );
  }
}
