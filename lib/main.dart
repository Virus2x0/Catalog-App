import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:flutter_for_trial/core/store.dart';
import 'package:flutter_for_trial/pages/home_page_2.dart';
import 'package:flutter_for_trial/widgets/theme.dart';
import 'package:flutter_for_trial/pages/login_page.dart';
import 'package:velocity_x/velocity_x.dart';

import 'firebase_options.dart';

void main() async {
  runApp(VxState(store: MyStore(), child: MyApp()));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Trial App",
      // home: LoginPage(),
      home: HomePage2(),
      themeMode: ThemeMode.system,
      theme: MyTheme.LightTheme(context),
      darkTheme: MyTheme.DarkTheme(context),
    );
  }
}
