import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:split/data/consts/animations.dart';
import 'package:split/data/util/formatter.dart';
import 'package:split/ui/components/common/custom_list_card.dart';
import 'package:split/ui/viewmodels/memo_overview_viewmodel.dart';

class MemoListCard extends StatelessWidget {
  ///MemoOverview画面のリストタイルコンポーネント
  const MemoListCard({
    Key? key,
    required this.memoIndex,
    required this.onTap,
    this.color = Colors.white,
  }) : super(key: key);

  //メモを特定するインデックス番号
  final int memoIndex;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MemoOverviewViewModel>();
    final memo = vm.memos[memoIndex];

    //長押しの際shakeさせるanimation_widget
    return AnimatedOpacity(
      opacity: memo.visible ? 1.0 : 0,
      //300ミリ秒かけてフェードアウトさせる
      duration: Durations.fadeDuration,
      child: ShakeAnimatedWidget(
        enabled: vm.isLongPressed,
        duration: Durations.shakeDuration,
        shakeAngle:
            memoIndex % 2 == 0 ? Rotation.deg(z: 0.4) : Rotation.deg(z: -0.4),
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
                    IconlyLight.document,
                    color: color,
                  ),
                ),
                title: Text(
                  memo.title,
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  Formatter.formatDate(memo.createdAt),
                  style: TextStyle(color: color),
                  overflow: TextOverflow.fade,
                ),
                trailing: Icon(
                  IconlyLight.arrow_right_2,
                  color: color,
                ),
              ),
            ),
            vm.isLongPressed
                ? GestureDetector(
                    onTap: () => vm.deleteMemo(memoIndex),
                    child: const Icon(IconlyBold.close_square),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
