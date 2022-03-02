
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/router.dart';
import 'package:pet_app/screens/home.dart';
import 'package:pet_app/screens/pet.dart';
import 'package:pet_app/screens/pet_behavior_search_view.dart';
import 'package:pet_app/screens/pet_search_view.dart';
import 'package:pet_app/screens/pets/pets_type_view.dart';
import 'package:pet_app/screens/service_view/service_search_view.dart';
import 'package:pet_app/screens/settings_view/add_pet_view.dart';
import 'package:pet_app/screens/settings_view/notifications_view.dart';
import 'package:pet_app/screens/vet_view/vet_page.dart';
import 'package:pet_app/screens/vet_view/vet_search_view.dart';
import 'package:pet_app/theme/color.dart';
import 'package:pet_app/utils/constant.dart';
import 'package:pet_app/utils/data.dart';
import 'package:pet_app/widgets/bottombar_item.dart';
import 'package:pet_app/widgets/custom_image.dart';
import 'package:pet_app/widgets/setting_item.dart';

class RootApp extends StatefulWidget {
  final int? activeIndex;
  const RootApp({ Key? key, this.activeIndex}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp>  with TickerProviderStateMixin {
  int activeTab = 0;
  List barItems = [
    {
      "icon" : "assets/icons/home-border.svg",
      "active_icon" : "assets/icons/home.svg",
      "page" : HomePage(),
      "title" : ""
    },
    {
      "icon" : "assets/icons/pet-border.svg",
      "active_icon" : "assets/icons/pet.svg",
      "page" : PetPage(),
      "title" : ""
    },
    {
      // "icon" : "assets/icons/chat-border.svg",
      // "active_icon" : "assets/icons/chat.svg",
      "icon" : "assets/icons/plus-border.svg",
      "active_icon" : "assets/icons/plus.svg",
      "page" : VetPage(),
      "title" : ""
    },
    {
      "icon" : "assets/icons/search.svg",
      "active_icon" : "assets/icons/searchZoom.svg",
      "page" : PetSearchView(),
      "title" : ""
    },

    {
      "icon" : "assets/icons/behaviorSearch.svg",
      "active_icon" : "assets/icons/behaviorSearch.svg",
      "page" : PetBehaviorSearchView(),
      "title" : ""
    },


  ];
//====== set animation=====
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: ANIMATED_BODY_MS),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    if(widget.activeIndex != null) {
      activeTab = widget.activeIndex!;
    }
     _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  animatedPage(page){
    return FadeTransition(
      child: page,
      opacity: _animation
    );
  }

  void onPageChanged(int index) {
    _controller.reset();
    setState(() {
      activeTab = index;
    });
    _controller.forward();
  }

//====== end set animation=====

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(),
      appBar: AppBar(
        centerTitle: false,
        title: activeTab == 0
            ? Text("Home")
            : activeTab == 1
                ? Text("Pets")
                : activeTab == 2
                    ? Text("Inform Your Vet")
                    : activeTab == 3
                        ? Text("Pet Search")
                        : Text("Personality Search"),
      ),
      body: getBarPage(),
      floatingActionButton: getBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget _drawer() {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
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
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // _menuItem("Services", Icon(Icons.add_box, color: Theme.of(context).primaryColor), serviceTypeRoute),
                  // _menuItem("Pet Articles", Icon(Icons.article, color: Theme.of(context).primaryColor), petArticleRoute),
                  // _menuItem("Support", Icon(Icons.headphones, color: Theme.of(context).primaryColor), supportRoute),
                  // _menuItem("About", Icon(Icons.info, color: Theme.of(context).primaryColor), aboutRoute),
                  //
                  // SizedBox(height: 10),
                  SettingItem(title: "Pets - Browse", leadingIcon: Icons.pets, leadingIconColor: blue,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PetsTypeView()));
                      }
                  ),
                  const SizedBox(height: 5),
                  SettingItem(title: "Pets - Search Breeds", leadingIcon: Icons.search_rounded, leadingIconColor: blue,
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>PetSearchView()));
                        Navigator.pop(context);
                        setState(() {
                          activeTab = 3;
                        });
                      }
                  ),
                  const SizedBox(height: 5),
                  SettingItem(title: "Pet - Match to Personality", leadingIcon: Icons.person_search_rounded, leadingIconColor: blue,
                      onTap: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>PetBehaviorSearchView()));
                        Navigator.pop(context);
                        setState(() {
                          activeTab = 4;
                        });
                      }
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: SettingItem(title: "Favorite pets", leadingIcon: Icons.favorite, leadingIconColor: red,
                        onTap: (){
                          Navigator.pushNamed(context, favoritePetRoute);
                        }
                    ),
                  ),
                  const SizedBox(height: 5),
                  SettingItem(title: "Veterinarian - Search", leadingIcon: Icons.add_box, leadingIconColor: blue,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>VetSearchView()));
                      }
                  ),
                  const SizedBox(height: 5),
                  SettingItem(title: "Veterinarian - Appointment", leadingIcon: Icons.people, leadingIconColor: blue,
                      onTap: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>VetPage()));
                        Navigator.pop(context);
                        setState(() {
                          activeTab = 2;
                        });
                      }
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: SettingItem(title: "Favorite Veterinarian", leadingIcon: Icons.favorite, leadingIconColor: sky,
                        onTap: (){
                          Navigator.pushNamed(context, favVetRoute);
                        }
                    ),
                  ),
                  const SizedBox(height: 5),
                  SettingItem(title: "Services", leadingIcon: Icons.home_repair_service, leadingIconColor: Colors.purple.shade300,
                    onTap: (){
                      Navigator.pushNamed(context, serviceTypeRoute);
                    },
                  ),
                  const SizedBox(height: 5),
                  SettingItem(title: "Services - Search", leadingIcon: Icons.search_rounded, leadingIconColor: blue,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ServiceSearchView()));
                      }
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: SettingItem(title: "Favorite Services", leadingIcon: Icons.favorite, leadingIconColor: pink,
                        onTap: (){
                          Navigator.pushNamed(context, favoriteServiceRoute);
                        }
                    ),
                  ),

                  const SizedBox(height: 5),
                  SettingItem(title: "Articles", leadingIcon: Icons.article, leadingIconColor: Colors.blue.shade300,
                    onTap: (){
                      Navigator.pushNamed(context, petArticleRoute);
                    },
                  ),
                  const SizedBox(height: 5),
                  SettingItem(title: "Support", leadingIcon: Icons.send_rounded, leadingIconColor: Colors.red.shade300,
                    onTap: (){
                      Navigator.pushNamed(context, supportRoute);
                    },
                  ),
                  const SizedBox(height: 5),
                  SettingItem(title: "Notifications/Updates", leadingIcon: Icons.notifications_on, leadingIconColor: blue,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationsView()));
                      }
                  ),
                  const SizedBox(height: 5),
                  SettingItem(title: "Our Message", leadingIcon: Icons.message, leadingIconColor: Colors.green.shade300,
                    onTap: (){
                      Navigator.pushNamed(context, aboutRoute);
                    },
                  ),
                  const SizedBox(height: 5),
                  SettingItem(title: "Appearance", leadingIcon: Icons.dark_mode_outlined, leadingIconColor: blue,
                      onTap: (){
                        Navigator.pushNamed(context, changeThemeRoute);
                      }
                  ),
                  const SizedBox(height: 5),
                  SettingItem(title: "Log Out", leadingIcon: Icons.logout_outlined, leadingIconColor: Colors.grey.shade400,
                    onTap: (){
                      showConfirmLogout();
                    },
                  ),

                  SizedBox(height: 80),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBarPage(){
    return
      IndexedStack(
        index: activeTab,
        children:
          List.generate(barItems.length,
            (index) => animatedPage(barItems[index]["page"])
          )
      );
  }

  Widget getBottomBar() {
    return Container(
      height: 55, width: double.infinity,
      margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0, 1)
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: 
          List.generate(barItems.length, 
            (index) => BottomBarItem( activeTab == index ? barItems[index]["active_icon"] : barItems[index]["icon"], "", isActive: activeTab == index, activeColor: primary,
              onTap: (){
                onPageChanged(index);
              },
            )
          )
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
}