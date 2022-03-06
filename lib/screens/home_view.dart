import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/router.dart';
import 'package:pet_app/utils/data.dart';
import 'package:pet_app/widgets/pet_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => buildBody(),
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }

  buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          profileCard(),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 25),
            child: Text("My Pets",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                )),
          ),
          getPets(),
          SizedBox(height: 55),
        ]),
      ),
    );
  }

  int selectedCategory = 0;

  Widget profileCard() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(),
            ),
            child: Text(
              "Your Information",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(profile, height: 80, width: 80,),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Peter"),
                    Text("Bye bye American pir")
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getPets() {
    double width = MediaQuery.of(context).size.width * .8;
    return CarouselSlider(
        options: CarouselOptions(
          height: 400,
          enlargeCenterPage: true,
          disableCenter: true,
          viewportFraction: .8,
        ),
        items: List.generate(
            pets.length,
            (index) => PetItem(
                  data: pets[index],
                  width: width,
                  onTap: () {
                    Navigator.of(context).pushNamed(petDetailRoute,
                        arguments: {"data": pets[index]});
                  },
                  onFavoriteTap: () {
                    setState(() {
                      pets[index]["is_favorited"] =
                          !pets[index]["is_favorited"];
                    });
                  },
                )));
  }
}
