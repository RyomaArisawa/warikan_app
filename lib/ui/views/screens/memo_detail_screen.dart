import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:split/data/consts/texts.dart';
import 'package:split/ui/components/common/custom_floating_action_button.dart';
import 'package:split/ui/components/common/cutom_app_bar.dart';
import 'package:split/ui/components/common/style/body_background.dart';
import 'package:split/ui/viewmodels/memo_detail_viewmodel.dart';

class MemoDetailScreen extends StatefulWidget {
  /// Memo Detail画面
  const MemoDetailScreen({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const MemoDetailScreen(),
    );
  }

  @override
  State<MemoDetailScreen> createState() => _MemoDetailScreenState();
}

class _MemoDetailScreenState extends State<MemoDetailScreen> {
  late final quill.QuillController quillController;
  late final MemoDetailViewModel vm;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm = context.read<MemoDetailViewModel>();
    quillController = quill.QuillController(
      document: quill.Document.fromJson(
        jsonDecode(vm.memo.content),
      ),
      selection: const TextSelection.collapsed(offset: 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: ScreenLabels.memo,
      ),
      body: BodyBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              vm.memo.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            quill.QuillEditor.basic(controller: quillController, readOnly: true)
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () => vm.pushMemoInput(context),
        buttonLabel: ButtonLabels.edit.toUpperCase(),
        iconData: IconlyLight.edit,
      ),
    );
  }
}
