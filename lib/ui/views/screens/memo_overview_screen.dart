import 'package:flutter/material.dart';
import 'package:warikan_app/ui/views/screens/memo_detail_screen.dart';

class MemoOverviewScreen extends StatelessWidget {
  const MemoOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => MemoDetailScreen()));
            },
            child: Text("Next"),
          ),
        ),
      ),
    );
  }
}
