
import 'package:flutter/material.dart';
import 'package:pet_app/screens/home.dart';
import 'package:pet_app/screens/pet.dart';
import 'package:pet_app/screens/pet_behavior_search_view.dart';
import 'package:pet_app/screens/pet_search_view.dart';
import 'package:pet_app/screens/vet_view/vet_page.dart';
import 'package:pet_app/theme/color.dart';
import 'package:pet_app/utils/constant.dart';
import 'package:pet_app/widgets/bottombar_item.dart';

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
      body: getBarPage(),
      floatingActionButton: getBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
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
}