import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/ui/components/common/custom_list_card.dart';
import 'package:warikan_app/ui/viewmodels/memo_overview_viewmodel.dart';

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
    final memo = vm.memoList[memoIndex];

    //長押しの際shakeさせるanimation_widget
    return ShakeAnimatedWidget(
      enabled: vm.isLongPressed,
      duration: const Duration(milliseconds: 250),
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
                margin:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
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
                memo.createdAt.toString(),
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
              ? const Positioned(
                  child: Icon(IconlyBold.close_square),
                )
              : Container(),
        ],
      ),
    );
  }
}
