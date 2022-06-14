import 'package:flutter/material.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/data/models/split.dart';
import 'package:warikan_app/ui/components/common/custom_dialog.dart';

class CalcDetailViewModel with ChangeNotifier {
  Split _split = Split.init();
  Split get split => _split;

  void setSplit(Split split) {
    _split = split;
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
