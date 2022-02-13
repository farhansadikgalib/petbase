import 'package:flutter/material.dart';
import 'package:pet_app/theme/color.dart';
import 'package:pet_app/utils/constant.dart';

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
            centerTitle: false,
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
        color: appBgColor,
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
            Expanded(child: Image.asset("assets/icons/appLogo.png")),
            Text("Service Name")
          ],
        ),
      ),
    );
  }
}
