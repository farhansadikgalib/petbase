import 'package:flutter/material.dart';
import 'package:pet_app/screens/settings_view/about.dart';
import 'package:pet_app/screens/pets/favorite_pet_view.dart';
import 'package:pet_app/screens/settings_view/pet_article.dart';
import 'package:pet_app/screens/pet_behavior_search_view.dart';
import 'package:pet_app/screens/pet_detail.dart';
import 'package:pet_app/screens/service_view/favorite_service_view.dart';
import 'package:pet_app/screens/service_view/service_detail_view.dart';
import 'package:pet_app/screens/service_view/service_search_view.dart';
import 'package:pet_app/screens/service_view/service_type.dart';
import 'package:pet_app/screens/service_view/services_view.dart';
import 'package:pet_app/screens/settings_view/change_theme_view.dart';
import 'package:pet_app/screens/settings_view/support.dart';
import 'package:pet_app/screens/vet_view/favorite_vet_view.dart';
import 'package:pet_app/screens/vet_view/vet_search_view.dart';
import 'screens/root_app.dart';

const rootAppRoute = "/root_app";
const petDetailRoute = "/pet_detail_page";

const serviceTypeRoute = "/service_Type_page";
const petArticleRoute = "/pet_Article_page";
const supportRoute = "/support_page";
const aboutRoute = "/about_page";
const servicesRoute = "/services_page";
const serviceDetailRoute = "/service_detail_page";
const petSearchRoute = "/pet_search_page";
const vetSearchRoute = "/vet_search_page";
const serviceSearchRoute = "/service_search_page";
const favoritePetRoute = "/favorite_pet_page";
const favoriteServiceRoute = "/favorite_service_page";
const changeThemeRoute = "/change_theme_page";
const favVetRoute = "/fav_vet_page";


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
      return MaterialPageRoute(builder: (context) => PetBehaviorSearchView());
    case vetSearchRoute :
      return MaterialPageRoute(builder: (context) => VetSearchView());
    case serviceSearchRoute :
      return MaterialPageRoute(builder: (context) => ServiceSearchView());
    case favoritePetRoute :
      return MaterialPageRoute(builder: (context) => FavoritePetView());
    case favoriteServiceRoute :
      return MaterialPageRoute(builder: (context) => FavoriteServiceView());
    case changeThemeRoute :
      return MaterialPageRoute(builder: (context) => ChangeThemeView());
    case favVetRoute :
      return MaterialPageRoute(builder: (context) => FavoriteVetView());
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
