import 'package:flutter/material.dart';

class BottomShader extends StatelessWidget {
  /// 画面下部を透明にするコンポーネント
  const BottomShader({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.white,
          ],
          stops: [
            0.95,
            1.0,
          ],
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: child,
    );
  }
}
