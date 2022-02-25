import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/router.dart';
import 'package:pet_app/screens/settings_view/add_pet_view.dart';
import 'package:pet_app/theme/color.dart';
import 'package:pet_app/utils/data.dart';
import 'package:pet_app/widgets/category_item.dart';
import 'package:pet_app/widgets/custom_image.dart';
import 'package:pet_app/widgets/pet_item.dart';
import 'package:pet_app/widgets/setting_item.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            actions: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: NotificationBox(
              //     notifiedNumber: 1,
              //     onTap: () {
              //
              //     },
              //   ),
              // )
              // IconButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, petSearchRoute);
              //   },
              //   icon: Icon(Icons.search),
              // ),
            ],
            // title: getAppBar(),
            title: Text("Home"),
            centerTitle: false,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => buildBody(),
              childCount: 1,
            ),
          )
        ],
      )
    );
  }

  Widget _drawer() {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 20.0),
            //   child: Image.asset("assets/icons/appLogo.png", scale: 2,),
            // ),
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: CustomImage(
                      profile,
                      // width: 80,
                      // height: 80,
                      radius: 15,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "User Name",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // _menuItem("Services", Icon(Icons.add_box, color: Theme.of(context).primaryColor), serviceTypeRoute),
                    // _menuItem("Pet Articles", Icon(Icons.article, color: Theme.of(context).primaryColor), petArticleRoute),
                    // _menuItem("Support", Icon(Icons.headphones, color: Theme.of(context).primaryColor), supportRoute),
                    // _menuItem("About", Icon(Icons.info, color: Theme.of(context).primaryColor), aboutRoute),
                    //
                    // SizedBox(height: 10),
                    SettingItem(title: "Add Pet", leadingIcon: Icons.add_box, leadingIconColor: blue,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPetView()));
                        }
                    ),
                    SettingItem(title: "Favorite pets", leadingIcon: Icons.favorite, leadingIconColor: red,
                        onTap: (){
                          Navigator.pushNamed(context, favoritePetRoute);
                        }
                    ),
                    SettingItem(title: "Favorite Veterinarian", leadingIcon: Icons.favorite, leadingIconColor: sky,
                        onTap: (){
                          Navigator.pushNamed(context, favVetRoute);
                        }
                    ),
                    SettingItem(title: "Services", leadingIcon: Icons.home_repair_service, leadingIconColor: Colors.purple.shade300,
                      onTap: (){
                        Navigator.pushNamed(context, serviceTypeRoute);
                      },
                    ),
                    SettingItem(title: "Favorite Services", leadingIcon: Icons.favorite, leadingIconColor: pink,
                        onTap: (){
                          Navigator.pushNamed(context, favoriteServiceRoute);
                        }
                    ),
                    SettingItem(title: "Articles", leadingIcon: Icons.article, leadingIconColor: Colors.blue.shade300,
                      onTap: (){
                        Navigator.pushNamed(context, petArticleRoute);
                      },
                    ),
                    SettingItem(title: "Appearance", leadingIcon: Icons.dark_mode_outlined, leadingIconColor: blue,
                        onTap: (){
                          Navigator.pushNamed(context, changeThemeRoute);
                        }
                    ),
                    SettingItem(title: "Privacy", leadingIcon: Icons.privacy_tip_outlined, leadingIconColor: orange,
                        onTap: (){

                        }
                    ),
                    SettingItem(title: "Support", leadingIcon: Icons.headphones, leadingIconColor: Colors.red.shade300,
                      onTap: (){
                        Navigator.pushNamed(context, supportRoute);
                      },
                    ),
                    SettingItem(title: "About", leadingIcon: Icons.info, leadingIconColor: Colors.green.shade300,
                      onTap: (){
                        Navigator.pushNamed(context, aboutRoute);
                      },
                    ),
                    SettingItem(title: "Log Out", leadingIcon: Icons.logout_outlined, leadingIconColor: Colors.grey.shade400,
                      onTap: (){
                        showConfirmLogout();
                      },
                    ),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showConfirmLogout(){
    showCupertinoModalPopup(
        context: context,
        builder: (context) =>
            CupertinoActionSheet(
                message: Text("Would you like to log out?"),
                actions: [
                  CupertinoActionSheetAction(
                    onPressed: (){

                    },
                    child: Text("Log Out", style: TextStyle(color: actionColor),),
                  )
                ],
                cancelButton:
                CupertinoActionSheetAction(child:
                Text("Cancel"),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                )
            )
    );
  }

  Widget _menuItem(String title, Widget iconWidget, String route) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      leading: iconWidget,
      title: Text(title),
    );
  }

  // Widget getAppBar(){
  //   return Container(
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Expanded(child:
  //             Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Row(
  //                   children: [
  //                     Icon(Icons.place_outlined, color: labelColor, size: 20,),
  //                     SizedBox(width: 5,),
  //                     Text("Location", style: TextStyle(color: labelColor, fontSize: 13,),),
  //                   ],
  //                 ),
  //                 SizedBox(height: 3,),
  //                 Text("Phnom Penh, Cambodia", style: TextStyle(color: textColor, fontWeight: FontWeight.w500, fontSize: 14,)),
  //               ],
  //             )
  //           ),
  //
  //           NotificationBox(
  //             notifiedNumber: 1,
  //             onTap: () {
  //
  //             },
  //           )
  //         ],
  //       ),
  //     );
  // }

  buildBody(){
    return
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                SizedBox(height: 25,),
                getCategories(),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 25),
                  child: Text("Adopt Me", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24,)),
                ),
                getPets(),
                SizedBox(height: 55),
              ]
          ),
        ),
      );
  }

  int selectedCategory = 0;
  getCategories(){
    List<Widget> lists = List.generate(categories.length, 
      (index) => CategoryItem(data: categories[index], selected: index == selectedCategory,
        onTap: (){
          setState(() {
            selectedCategory =  index;
          });
        },
      )
    );
    return
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(bottom: 5, left: 15),
        child: Row(
          children: lists
        ),
      );
  }

  getPets(){
    double width = MediaQuery.of(context).size.width * .8;
    return
    CarouselSlider(
        options: CarouselOptions(
          height: 400,
          enlargeCenterPage: true,
          disableCenter: true,
          viewportFraction: .8,
        ),
        items: List.generate(pets.length, 
          (index) => PetItem(
            data: pets[index], 
            width:  width,
            onTap: (){
              Navigator.of(context).pushNamed(petDetailRoute, arguments: {"data" : pets[index]});
            },
            onFavoriteTap: (){
              setState(() {
                pets[index]["is_favorited"] = ! pets[index]["is_favorited"];
              });
            },
          )
        )
      );
  }


}