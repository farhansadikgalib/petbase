import 'package:flutter/material.dart';
import 'package:pet_app/screens/about.dart';
import 'package:pet_app/screens/pet_article.dart';
import 'package:pet_app/screens/pet_detail.dart';
import 'package:pet_app/screens/service.dart';
import 'package:pet_app/screens/support.dart';
import 'package:pet_app/utils/constant.dart';
import 'screens/root_app.dart';

Route<dynamic> generateRoute(RouteSettings setting) {
  final Map<String, dynamic> args = checkIsNullValue(setting.arguments) ? new Map<String, dynamic>() : setting.arguments as Map<String, dynamic>;
  switch (setting.name) { 
    case rootAppRoute :
      return MaterialPageRoute(builder: (context) => RootApp());
    case petDetailRoute :
      return MaterialPageRoute(builder: (context) => PetDetailPage(
        data: args["data"] as  Map<String, dynamic>
      ));
    case serviceRoute :
      return MaterialPageRoute(builder: (context) => ServiceScreen());
    case petArticleRoute :
      return MaterialPageRoute(builder: (context) => PetArticle());
    case supportRoute :
      return MaterialPageRoute(builder: (context) => Support());
    case aboutRoute :
      return MaterialPageRoute(builder: (context) => About());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Text("No Page"),
        ),
      );
  }
}

checkIsNullValue(value) {
  return [null, "null", 0, "0", ""].contains(value);
}
