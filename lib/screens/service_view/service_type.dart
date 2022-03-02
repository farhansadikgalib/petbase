import 'package:flutter/material.dart';
import 'package:pet_app/router.dart';
import 'package:pet_app/theme/color.dart';

class ServiceTypeView extends StatefulWidget {
  const ServiceTypeView({Key? key}) : super(key: key);

  @override
  _ServiceTypeViewState createState() => _ServiceTypeViewState();
}

class _ServiceTypeViewState extends State<ServiceTypeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            title: Text("Service Types"),
            actions: [
              // IconButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, serviceSearchRoute);
              //   },
              //   icon: Icon(Icons.search),
              // ),
            ],
          ),
          SliverPadding(
            padding: EdgeInsets.all(15),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: [
                _serviceCardWidget(),
                _serviceCardWidget(),
                _serviceCardWidget(),
                _serviceCardWidget(),
                _serviceCardWidget(),
                _serviceCardWidget(),
                _serviceCardWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _serviceCardWidget() {
    return Container(
      padding: EdgeInsets.all(10),
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
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, servicesRoute);
        },
        child: Column(
          children: [
            //Expanded(child: Image.asset("assets/icons/appLogo.png")),
            Expanded(child: Image.asset("assets/petService.png", color: Theme.of(context).primaryColor, scale: 6,)),
            Text("Service Name")
          ],
        ),
      ),
    );
  }
}
