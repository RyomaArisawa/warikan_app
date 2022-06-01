import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/providers/provider.dart';
import 'package:warikan_app/ui/views/screens/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: globalProviders,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SignInScreen(),
      ),
    );
  }
}
