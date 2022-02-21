import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/router.dart';
import 'package:pet_app/theme/color.dart';

class FavoriteServiceView extends StatefulWidget {
  const FavoriteServiceView({Key? key}) : super(key: key);

  @override
  _FavoriteServiceViewState createState() => _FavoriteServiceViewState();
}

class _FavoriteServiceViewState extends State<FavoriteServiceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Favorite services"),
            pinned: true,
            floating: true,
            centerTitle: false,
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
        Navigator.pushNamed(context, serviceDetailRoute);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
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
            SvgPicture.asset("assets/icons/pet.svg"),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name"),
                  Text("City"),
                  Text("ZipCode"),
                ],
              ),
            ),
            Text("State")
          ],
        ),
      ),
    );
  }
}
