import 'package:flutter/material.dart';

class ServiceDetailView extends StatefulWidget {
  const ServiceDetailView({Key? key}) : super(key: key);

  @override
  _ServiceDetailViewState createState() => _ServiceDetailViewState();
}

class _ServiceDetailViewState extends State<ServiceDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Service Detail"),
            centerTitle: false,
          ),
          SliverPadding(
            padding: EdgeInsets.all(15),
            sliver: SliverList(delegate: SliverChildListDelegate([
              _serviceDetailCardWidget(),
              TextButton(
                onPressed: () {},
                child: Text("Find others like this"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 0)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text("Save to My Favorites"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                ),
              ),
            ])),
          ),
        ],
      ),
    );
  }

  Widget _serviceDetailCardWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset("assets/img.png", scale: 2,),
              Image.asset("assets/petService.png", color: Theme.of(context).primaryColor, scale: 7,),
              const SizedBox(width: 20),
              Column(
                children: [
                  Text("Category"),
                  Text("Biztype"),
                ],
              )
            ],
          ),
          const SizedBox(height: 30),
          Text("Name"),
          Text("Website"),
          SizedBox(height: 30),

          Text("Location"),
          Text("Phone"),
          Text("Email"),
          SizedBox(height: 30),




        ],
      ),
    );
  }
}
