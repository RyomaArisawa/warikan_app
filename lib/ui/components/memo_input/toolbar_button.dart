import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/consts/animations.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/viewmodels/memo_input_viewmodel.dart';

class ToolbarButton extends StatelessWidget {
  //Toolbarの表示切り替えコンポーネント
  const ToolbarButton({Key? key, required this.animationController})
      : super(key: key);

  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MemoInputViewModel>();
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(ButtonLabels.toolbar),
          IconButton(
            onPressed: () => vm.showToolbar(animationController),
            icon: AnimatedRotation(
              turns: vm.turns,
              duration: Durations.accordionDuration,
              child: const Icon(
                IconlyLight.arrow_down_2,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
