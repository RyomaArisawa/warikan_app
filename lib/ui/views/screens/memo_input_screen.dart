import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:provider/provider.dart';
import 'package:warikan_app/data/consts/animations.dart';
import 'package:warikan_app/data/consts/enum.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/components/common/custom_floating_action_button.dart';
import 'package:warikan_app/ui/components/common/cutom_app_bar.dart';
import 'package:warikan_app/ui/components/common/style/body_background.dart';
import 'package:warikan_app/ui/components/memo_input/toolbar_button.dart';
import 'package:warikan_app/ui/viewmodels/memo_input_viewmodel.dart';

class MemoInputScreen extends StatefulWidget {
  /// MemoInput画面
  const MemoInputScreen({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const MemoInputScreen(),
    );
  }

  @override
  State<MemoInputScreen> createState() => _MemoInputScreenState();
}

class _MemoInputScreenState extends State<MemoInputScreen>
    with SingleTickerProviderStateMixin {
  //flutter_quillのコントローラー
  late quill.QuillController quillController;
  //accordionアニメーションのコントローラー
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    quillController = quill.QuillController.basic();
    animationController = AnimationController(
      vsync: this,
      duration: Durations.accordionDuration,
    );
  }

  @override
  void dispose() {
    quillController.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _globalKey = GlobalKey<FormState>();
    final vm = context.read<MemoInputViewModel>();

    return Scaffold(
      appBar: const CustomAppBar(
        title: ScreenLabels.memo,
      ),
      body: BodyBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ToolbarButton(animationController: animationController),
              SizeTransition(
                sizeFactor: CurvedAnimation(
                  curve: Curves.fastOutSlowIn,
                  parent: animationController,
                ),
                child: quill.QuillToolbar.basic(
                  controller: quillController,
                  toolbarSectionSpacing: 1,
                  toolbarIconAlignment: WrapAlignment.start,
                ),
              ),
              Form(
                key: _globalKey,
                child: TextFormField(
                  initialValue:
                      vm.inputMode == InputMode.edit ? vm.memo!.title : null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: FormLabels.title,
                  ),
                  style: const TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: vm.inputTitle,
                  validator: vm.titleValidator,
                ),
              ),
              quill.QuillEditor.basic(
                controller: quillController,
                readOnly: false,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        iconData: Icons.check,
        buttonLabel: ButtonLabels.save,
        onPressed: () => vm.saveMemo(context, _globalKey, quillController),
      ),
    );
  }
}
