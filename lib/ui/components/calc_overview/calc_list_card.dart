import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/consts/animations.dart';
import 'package:warikan_app/data/util/formatter.dart';
import 'package:warikan_app/ui/components/common/custom_list_card.dart';
import 'package:warikan_app/ui/viewmodels/calc_overview_viewmodel.dart';

class CalcListCard extends StatelessWidget {
  ///CalcOverview画面のリストタイルコンポーネント
  //暫定的コンストラクタ
  const CalcListCard(
      {Key? key,
      required this.splitIndex,
      this.color = Colors.white,
      required this.onTap})
      : super(key: key);

  final int splitIndex;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CalcOverviewViewModel>();
    final split = vm.splits[splitIndex];

    //長押しの際shakeさせるanimation_widget
    return AnimatedOpacity(
      opacity: split.visible ? 1.0 : 0,
      //300ミリ秒かけてフェードアウトさせる
      duration: Durations.fadeDuration,
      child: ShakeAnimatedWidget(
        enabled: vm.isLongPressed,
        duration: Durations.shakeDuration,
        shakeAngle:
            splitIndex % 2 == 0 ? Rotation.deg(z: 0.4) : Rotation.deg(z: -0.4),
        curve: Curves.linear,
        child: Stack(
          children: [
            CustomListCard(
              onTap: onTap,
              onLongPress: vm.setLongPressed,
              child: ListTile(
                leading: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 6.0),
                  padding: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 2.0, color: color),
                    ),
                  ),
                  child: Icon(
                    split.isSettled
                        ? Icons.check_box_outlined
                        : Icons.check_box_outline_blank,
                    color: color,
                  ),
                ),
                title: Text(
                  split.title,
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
                subtitle: Row(
                  children: [
                    Text(
                      Formatter.formatDate(split.createdAt),
                      style: TextStyle(color: color),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      Formatter.formatCost(split.totalCost),
                      style: TextStyle(color: color),
                    ),
                  ],
                ),
                trailing: Icon(
                  IconlyLight.arrow_right_2,
                  color: color,
                ),
              ),
            ),
            vm.isLongPressed
                ? GestureDetector(
                    onTap: () => vm.deleteSplit(splitIndex),
                    child: const Icon(IconlyBold.close_square),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
