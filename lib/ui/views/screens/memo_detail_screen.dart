import 'package:flutter/material.dart';

class MemoDetailScreen extends StatelessWidget {
  const MemoDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("memo detail"),
      ),
      body: Text("memo detail"),
    );
  }
}
