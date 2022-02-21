import 'package:flutter/material.dart';
import 'package:pet_app/router.dart';
import 'package:pet_app/utils/data.dart';
import 'package:pet_app/widgets/recent_item.dart';

class FavoritePetView extends StatefulWidget {
  const FavoritePetView({Key? key}) : super(key: key);

  @override
  _FavoritePetViewState createState() => _FavoritePetViewState();
}

class _FavoritePetViewState extends State<FavoritePetView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text("Favorites"),
        centerTitle: false,
      ),
      body: getPets(),
    );
  }

  getPets(){
    return
      SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 5, left: 15, right: 15, top: 15),
        child: Column(
            children: List.generate(favPets.length,
                    (index) => Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: RecentItem(
                    onTap: (){
                      Navigator.of(context).pushNamed(petDetailRoute, arguments: {"data" : favPets[index]});
                    },
                    data: favPets[index],
                    onFavoriteTap: (){
                      setState(() {
                        favPets[index]["is_favorited"] = ! favPets[index]["is_favorited"];
                      });
                    },
                  ),
                )
            )
        ),
      );
  }
}
