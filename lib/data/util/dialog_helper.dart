import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:split/data/consts/texts.dart';
import 'package:split/data/util/validator.dart';
import 'package:split/ui/components/common/custom_dialog.dart';
import 'package:split/ui/views/screens/calc_overview_screen.dart';

class DialogHelper {
  ///割り勘情報保存ダイアログ
  static showCalcSaveDialog({
    required BuildContext context,
    required ValueChanged<String> formFunction,
    required String initialValue,
    required AsyncCallback saveFunction,
  }) {
    final _globalKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (dialogContext) => CustomDialog(
        title: DialogTexts.titleSettleDialog,
        content: Form(
          key: _globalKey,
          child: TextFormField(
            initialValue: initialValue,
            decoration: const InputDecoration(
              hintText: FormLabels.splitTitle,
            ),
            onChanged: formFunction,
            validator: Validator.titleValidator,
          ),
        ),
        primaryText: ButtonLabels.save,
        secondaryText: ButtonLabels.cancel,
        onPressed: () async {
          if (_globalKey.currentState!.validate()) {
            //割り勘情報登録
            await saveFunction();

            //ダイアログを閉じる
            Navigator.pop(dialogContext);

            //一覧画面へ遷移
            Navigator.pushAndRemoveUntil(
              context,
              CalcOverviewScreen.route(),
              (_) => false,
            );
          }
        },
      ),
    );
  }

  ///割り勘精算ダイアログ
  static showSettleDialog({
    required BuildContext context,
    required VoidCallback onPressed,
  }) {
    showDialog(
      context: context,
      builder: (dialogContext) => CustomDialog(
        title: DialogTexts.titleSettleDialog,
        content: const Text(DialogTexts.askSettleDialog),
        onPressed: () {
          onPressed();

          //ダイアログを閉じる
          Navigator.pop(dialogContext);
          //一覧画面へ遷移
          Navigator.pushAndRemoveUntil(
            context,
            CalcOverviewScreen.route(),
            (_) => false,
          );
        },
      ),
    );
  }

  ///パスワード初期化ダイアログ
  static showResetPasswordDialog({
    required BuildContext context,
    required ValueChanged<String> formFunction,
    required AsyncCallback sendFunction,
  }) {
    final _globalKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (dialogContext) => CustomDialog(
        title: DialogTexts.titleResetPasswordDialog,
        content: Form(
          key: _globalKey,
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: FormLabels.email,
            ),
            onChanged: formFunction,
            validator: Validator.emailValidator,
          ),
        ),
        primaryText: ButtonLabels.send,
        secondaryText: ButtonLabels.cancel,
        onPressed: () async {
          if (_globalKey.currentState!.validate()) {
            //パスワード初期化
            await sendFunction();

            //ダイアログを閉じる
            Navigator.pop(dialogContext);
          }
        },
      ),
    );
  }
}
