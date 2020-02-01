import 'dart:async';

import 'package:flutter/material.dart';
import 'src/bloc/bloc.dart';
import 'src/homepage.dart';
import 'src/theme/theme.dart';
import 'src/watchDetail.dart';
import 'src/widget/customRoute.dart';

void main() {
  runApp(MyApp());
 
}

class MyApp extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
     return StreamBuilder(
      stream: bloc.darkThemeEnabled,
      initialData: true,
      builder: (context, snapshot) => MaterialApp(
          theme: snapshot.data ? AppTheme.darkTheme : AppTheme.lightTheme,
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
        }),
    );
  }
}
final bloc = Bloc();