import 'dart:ui';

import 'package:flutter/material.dart';
import '../theme/darkColors.dart';
import 'lightColors.dart';

enum ThemeType { Dark, Light }
const TextStyle titleStyle =
    const TextStyle(color: DarkColor.titleTextColor, fontSize: 18);
const TextStyle subTitleStyle =
    const TextStyle(color: DarkColor.subTitleTextColor, fontSize: 12);

const double blurRadius = 4;
const double spreadRadius = 1;
const double offset = 2;

List<BoxShadow> shadow = <BoxShadow>[
  BoxShadow(
      color: DarkColor.Darker,
      offset: Offset(offset, offset),
      blurRadius: blurRadius,
      spreadRadius: spreadRadius),
  BoxShadow(
      color: DarkColor.Brighter,
      offset: Offset(-offset, -offset),
      blurRadius: blurRadius,
      spreadRadius: spreadRadius),
];
// BoxDecoration widgetSelectedDecoration = BoxDecoration(
//     color: DarkColor.backgroundColor,
//     borderRadius: BorderRadius.circular(5),
//     gradient: LinearGradient(
//       begin: Alignment.topLeft,
//       end: Alignment.bottomRight,
//       colors: [Colors.deepOrange[900], Colors.deepOrange],
//     ));

class AppTheme {
  static BoxDecoration getDecoration(BuildContext context,
      {double borderRadius = 0}) {
    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [
            .2,
            .4,
            .7
          ],
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondaryVariant,
            Theme.of(context).colorScheme.primary,
          ]),
    );
  }

  static List<BoxShadow> getshadow(
    BuildContext context,
  ) {
    return <BoxShadow>[
      BoxShadow(
          color: Theme.of(context).primaryColorDark,
          offset: Offset(offset, offset),
          blurRadius: blurRadius,
          spreadRadius: spreadRadius),
      BoxShadow(
          color: Theme.of(context).primaryColorLight,
          offset: Offset(-offset, -offset),
          blurRadius: blurRadius,
          spreadRadius: spreadRadius),
    ];
  }

  static ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.blue,
      backgroundColor: DarkColor.background,
      primaryColor: DarkColor.black,
      primaryColorDark: DarkColor.Darker,
      primaryColorLight: DarkColor.Brighter,
      colorScheme: ColorScheme(
          primary: DarkColor.darkPink,
          primaryVariant: DarkColor.purple,
          secondary: DarkColor.lightBlue,
          secondaryVariant: DarkColor.darkBlue,
          surface: DarkColor.background,
          background: DarkColor.background,
          error: Colors.red,
          onPrimary: DarkColor.titleTextColor,
          onSecondary: DarkColor.white,
          onSurface: DarkColor.titleTextColor,
          onBackground: DarkColor.titleTextColor,
          onError: DarkColor.titleTextColor,
          brightness: Brightness.dark),
      textTheme: TextTheme(display1: TextStyle(color: Color(0xffd1d1d0))),
      iconTheme: IconThemeData(color: DarkColor.lightGrey));
  static ThemeData lightTheme = ThemeData(
      primarySwatch: Colors.blue,
      backgroundColor: LightColor.background,
      primaryColor: LightColor.black,
      accentColor: LightColor.lightblack,
      primaryColorDark: LightColor.Darker,
      primaryColorLight: LightColor.Brighter,
      colorScheme: ColorScheme(
          primary: DarkColor.darkPink,
          primaryVariant: DarkColor.purple,
          secondary: DarkColor.lightBlue,
          secondaryVariant: DarkColor.darkBlue,
          surface: DarkColor.background,
          background: DarkColor.background,
          error: Colors.red,
          onPrimary: DarkColor.titleTextColor,
          onSecondary: LightColor.Darker,
          onSurface: DarkColor.titleTextColor,
          onBackground: DarkColor.titleTextColor,
          onError: DarkColor.titleTextColor,
          brightness: Brightness.dark),
      cardTheme: CardTheme(color: LightColor.background),
      textTheme: TextTheme(display1: TextStyle(color: LightColor.black)),
      iconTheme: IconThemeData(color: LightColor.lightblack));
}
