// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

Color bg = Color(0xffF9FAFE);
Color fg = Color(0xff1F314A);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  platform: TargetPlatform.iOS,
  primaryColor: Color(0xff2DC3B5),
  primaryColorDark: Colors.black87,
  primaryColorLight: Colors.white,
  backgroundColor: bg,

  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 16,
      color: fg,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: bg,
    elevation: 0,
    centerTitle: true,
    foregroundColor: fg,
    // iconTheme: IconThemeData(color: fg),
    // actionsIconTheme: IconThemeData(color: fg),
  ),
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.black87),
    headline2: TextStyle(fontSize: 36.0, color: Colors.black87),
    headline3: TextStyle(fontSize: 24.0, color: Colors.black87),
    headline4: TextStyle(fontSize: 18.0, color: Colors.black87),
    headline5: TextStyle(fontSize: 14.0, color: Colors.black87),
    headline6: TextStyle(fontSize: 12.0, color: Colors.black87),
    bodyText1: TextStyle(fontSize: 14.0, color: Colors.black87),
    bodyText2: TextStyle(fontSize: 12.0, color: Colors.black87),
    subtitle1: TextStyle(fontSize: 14.0, color: Colors.black87),
    subtitle2: TextStyle(fontSize: 12.0, color: Colors.black87),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      fontSize: 12,
      color: Colors.black26,
    ),
  ),
  // switchTheme: SwitchTheme(),
  scaffoldBackgroundColor: bg,
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  }),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  platform: TargetPlatform.iOS,
  primaryColor: Color(0xff2DC3B5),
  scaffoldBackgroundColor: Color(0xff01152E),
  primaryColorDark: Colors.white60,
  backgroundColor: Color(0xff01152E),
  bottomAppBarColor: Color(0xff01152E),
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 42.0, fontWeight: FontWeight.bold),
    headline2: TextStyle(fontSize: 32.0, color: Colors.white),
    headline3: TextStyle(fontSize: 24.0, color: Colors.white),
    headline4: TextStyle(fontSize: 18.0, color: Colors.white),
    headline5: TextStyle(fontSize: 14.0, color: Colors.white),
    headline6: TextStyle(fontSize: 12.0, color: Colors.white),
    bodyText1: TextStyle(fontSize: 16.0, color: Colors.white),
    bodyText2: TextStyle(fontSize: 14.0, color: Colors.white),
    subtitle1: TextStyle(fontSize: 16.0, color: Colors.white),
    subtitle2: TextStyle(fontSize: 14.0, color: Colors.white),
  ),
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(fontSize: 16, color: fg),
    centerTitle: true,
    backgroundColor: Color(0xff01152E),
    elevation: 0,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  }),
);

// ignore_for_file: annotate_overrides
const decoration1 = BoxDecoration(
  gradient: LinearGradient(
    // begin: Alignment.topCenter,
    // end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(55, 236, 186, 1),
      Color.fromRGBO(114, 175, 211, 1),
    ],
  ),
);
const decoration2 = BoxDecoration(
  gradient: LinearGradient(
    // begin: Alignment.topCenter,
    // end: Alignment.bottomCenter,
    colors: [
      Color(0XFF372660),
      Color(0XFF2A5A7E),
    ],
  ),
);

class MTheme {
  static bool dark = true; // 是否为黑夜模式
  static ThemeData darkTheme(context) {
    return ThemeData.dark();
  } // 主题为暗色

  static BoxDecoration shadow = const BoxDecoration(
    boxShadow: [
      BoxShadow(offset: Offset(0, 20), blurRadius: 30, spreadRadius: 0, color: Color.fromRGBO(45, 195, 181, 0.2)
          // 0px 20px 30px 0px rgba(45,195,181,0.2)
          )
    ],
  );

  static ThemeData lightTheme(context) {
    return ThemeData(
      primaryColor: Colors.teal,
      splashColor: Colors.yellow,
      platform: TargetPlatform.iOS,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black87,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          // fontWeight: FontWeight.bold,
        ),
        // titleTextStyle: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  static InputDecoration get roundInput => InputDecoration(
        hintText: "Search...",
        hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey.shade500,
          size: 20,
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.all(8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.black12,
          ),
        ),
      );

  // static InputDecoration roundSearch = roundInput.copyWith(
  // );

  static InputDecoration input = InputDecoration(
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    border: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1,
      ),
    ),
  );
}
