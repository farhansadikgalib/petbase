import 'package:flutter/material.dart';
import 'package:pet_app/router.dart';
import 'package:pet_app/theme/color.dart';

class FavoriteVetView extends StatefulWidget {
  const FavoriteVetView({Key? key}) : super(key: key);

  @override
  _FavoriteVetViewState createState() => _FavoriteVetViewState();
}

class _FavoriteVetViewState extends State<FavoriteVetView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Favorite Vets"),
            pinned: true,
            floating: true,
          ),
          SliverPadding(
            padding: EdgeInsets.all(15),
            sliver: SliverList(delegate: SliverChildListDelegate([
              _servicesCardWidget(),
              _servicesCardWidget(),
              _servicesCardWidget(),
              _servicesCardWidget(),
            ])),
          ),
        ],
      ),
    );
  }

  Widget _servicesCardWidget() {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, serviceDetailRoute);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: primary,
              blurRadius: 0.5,
              spreadRadius: 0.3,
              blurStyle: BlurStyle.outer,
            )
          ],
        ),
        child: Row(
          children: [
            Image.asset("assets/vets.png", color: Theme.of(context).primaryColor, scale: 2.5,),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name"),
                  Text("Address"),
                  Text("City"),
                  Text("ZipCode"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
