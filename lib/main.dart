import "package:flutter/material.dart";
import 'package:flutter_for_trial/pages/home_page_2.dart';
import 'package:flutter_for_trial/widgets/theme.dart';
import 'package:flutter_for_trial/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Trial App",
      home: LoginPage(),
      themeMode: ThemeMode.system,
      theme: MyTheme.LightTheme(context),
      darkTheme: MyTheme.DarkTheme(context),
    );
  }
}
