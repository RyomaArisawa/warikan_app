import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class MemoInputViewModel with ChangeNotifier {
  final QuillController _controller = QuillController.basic();
  QuillController get controller => _controller;

  bool _isShowToolbar = false;
  bool get isShowToolbar => _isShowToolbar;

  void showToolbar(AnimationController animationController) {
    _isShowToolbar = !_isShowToolbar;
    if (_isShowToolbar) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
    notifyListeners();
  }
}
