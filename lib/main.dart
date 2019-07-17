import 'package:flutter/material.dart';
import 'package:wtime/utilities/constant.dart';
import 'screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wtime',
      theme: ThemeData(
        scaffoldBackgroundColor: colorBackgroundScaffold,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
