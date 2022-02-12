import 'package:flutter/material.dart';
import 'screens/root_app.dart';
import 'theme/color.dart';
import 'router.dart' as router;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      title: 'petBase',
      theme: ThemeData(
        primaryColor: primary,
        scaffoldBackgroundColor: appBgColor,
        appBarTheme: AppBarTheme(
          backgroundColor: appBgColor,
          foregroundColor: primary

        )
      ),
      home: RootApp(),
    );
  }

}