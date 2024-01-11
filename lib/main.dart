import 'package:flutter/material.dart';
import 'package:webviewflutter/screen/MyHomePage.dart';
import 'package:webviewflutter/screen/home.dart';
import 'package:webviewflutter/screen/testchat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home:  BottomSheetApp(),
    );
  }
}