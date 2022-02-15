import 'package:flutter/material.dart';
import 'package:pet_app/screens/about.dart';
import 'package:pet_app/screens/favorite_pet_view.dart';
import 'package:pet_app/screens/pet_article.dart';
import 'package:pet_app/screens/pet_detail.dart';
import 'package:pet_app/screens/pet_search_view.dart';
import 'package:pet_app/screens/service_view/favorite_service_view.dart';
import 'package:pet_app/screens/service_view/service_detail_view.dart';
import 'package:pet_app/screens/service_view/service_search_view.dart';
import 'package:pet_app/screens/service_view/service_type.dart';
import 'package:pet_app/screens/service_view/services_view.dart';
import 'package:pet_app/screens/support.dart';
import 'package:pet_app/screens/vet_view/vet_search_view.dart';
import 'package:pet_app/utils/constant.dart';
import 'screens/root_app.dart';

Route<dynamic> generateRoute(RouteSettings setting) {
  final Map<String, dynamic> args = checkIsNullValue(setting.arguments) ? new Map<String, dynamic>() : setting.arguments as Map<String, dynamic>;
  switch (setting.name) { 
    case rootAppRoute :
      return MaterialPageRoute(builder: (context) => RootApp(activeIndex: args["data"] as int,));
    case petDetailRoute :
      return MaterialPageRoute(builder: (context) => PetDetailPage(
        data: args["data"] as  Map<String, dynamic>
      ));
    case serviceTypeRoute :
      return MaterialPageRoute(builder: (context) => ServiceTypeView());
    case petArticleRoute :
      return MaterialPageRoute(builder: (context) => PetArticle());
    case supportRoute :
      return MaterialPageRoute(builder: (context) => Support());
    case aboutRoute :
      return MaterialPageRoute(builder: (context) => About());
    case servicesRoute :
      return MaterialPageRoute(builder: (context) => ServicesView());
    case serviceDetailRoute :
      return MaterialPageRoute(builder: (context) => ServiceDetailView());
    case petSearchRoute :
      return MaterialPageRoute(builder: (context) => PetSearchView());
    case vetSearchRoute :
      return MaterialPageRoute(builder: (context) => VetSearchView());
    case serviceSearchRoute :
      return MaterialPageRoute(builder: (context) => ServiceSearchView());
    case favoritePetRoute :
      return MaterialPageRoute(builder: (context) => FavoritePetView());
    case favoriteServiceRoute :
      return MaterialPageRoute(builder: (context) => FavoriteServiceView());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(child: Text("No Page")),
        ),
      );
  }
}

checkIsNullValue(value) {
  return [null, "null", 0, "0", ""].contains(value);
}
