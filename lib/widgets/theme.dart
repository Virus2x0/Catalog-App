import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData LightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.lato().fontFamily,
        accentColor: NaviBlueColor,
        buttonColor: Colors.blue,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          foregroundColor: Colors.black,
        ),
      );

  static ThemeData DarkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.lato().fontFamily,
        cardColor: Colors.black,
        canvasColor: darkCreamColor,
        accentColor: Colors.white,
        buttonColor: LightblueColor,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
        appBarTheme: AppBarTheme(
          // textTheme: Theme.of(context).textTheme.copyWith(
          //     headline6:
          //         context.textTheme.headline6?.copyWith(color: Colors.white)),
          centerTitle: true,
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          foregroundColor: Colors.white,
        ),
      );

  static Color creamColor = Color(0xfff5f5f5);
  static Color NaviBlueColor = Color(0xff403b58);
  static Color darkCreamColor = Vx.gray900;
  static Color LightblueColor = Vx.indigo500;
}
