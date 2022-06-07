import 'package:flutter/material.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/data/models/split_info.dart';

class CalcDetailViewModel with ChangeNotifier {
  SplitInfo _splitInfo = SplitInfo.init();
  SplitInfo get splitInfo => _splitInfo;

  void setSplitInfo(SplitInfo splitInfo) {
    _splitInfo = splitInfo;
  }

  showCompleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text(DialogTexts.titleCompleteDialog),
        content: const Text(
          DialogTexts.askCompleteDialog,
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text(ButtonLabels.yes),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text(ButtonLabels.no),
          )
        ],
      ),
    );
  }
}
