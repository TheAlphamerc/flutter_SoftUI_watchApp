import 'dart:ui';

import 'package:flutter/material.dart';
import '../theme/darkColors.dart';

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
BoxDecoration widgetSelectedDecoration = BoxDecoration(
    color: DarkColor.backgroundColor,
    borderRadius: BorderRadius.circular(5),
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.deepOrange[900], Colors.deepOrange],
    ));
