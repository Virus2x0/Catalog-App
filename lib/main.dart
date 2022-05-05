import "package:flutter/material.dart";
import 'package:flutter_for_trial/btn_click.dart';

import 'package:flutter_for_trial/drawer.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_for_trial/login_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Trial App",
    //home: BottomMenu(),
    home: LoginPage(),
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.lato().fontFamily,
      primaryTextTheme: GoogleFonts.latoTextTheme(),
    ),
  ));
}
