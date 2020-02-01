import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_soft_ui/src/theme/lightColors.dart';
import 'package:flutter_soft_ui/src/theme/darkColors.dart';
import 'package:flutter_soft_ui/src/theme/theme.dart';
import 'package:flutter_soft_ui/src/widget/customClipPainter.dart';
import 'package:flutter_soft_ui/src/widget/softContainer.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/homepage.dart';
import 'src/watchDetail.dart';
import 'src/widget/customRoute.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xff141414), // navigation bar color
    statusBarColor: Color(0xff141414), // status bar color
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            backgroundColor: DarkColor.background,
            primaryColor: DarkColor.black,
            accentColor: DarkColor.lightblack,
            cardTheme: CardTheme(color: DarkColor.backgroundColor),
            textTheme: TextTheme(display1: TextStyle(color: Color(0xffd1d1d0))),
            iconTheme: IconThemeData(color: DarkColor.lightGrey)),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/': (_) => MyHomePage(),
          '/detail': (_) => WatchDetailPage()
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] == '') {
            return null;
          }
          if (pathElements[0] == 'detail') {
            return CustomRoute<bool>(
                builder: (BuildContext context) => WatchDetailPage());
          }
        });
  }
}
