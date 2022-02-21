import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:pet_app/theme/color.dart';
import 'package:pet_app/utils/constant.dart';
import 'package:pet_app/utils/data.dart';
import 'package:pet_app/widgets/attribute_box.dart';
import 'package:pet_app/widgets/custom_button.dart';
import 'package:pet_app/widgets/custom_image.dart';
import 'package:pet_app/widgets/favorite_box.dart';
import 'package:pet_app/widgets/icon_box.dart';

class PetDetailPage extends StatefulWidget {
  final data;
  PetDetailPage({ Key? key, required this.data}) : super(key: key);

  @override
  _PetDetailPageState createState() => _PetDetailPageState();
}

class _PetDetailPageState extends State<PetDetailPage> {
  var data;
  bool showBody = false;
  @override
  void initState() {
    super.initState();
    data = widget.data;
    Future.delayed(Duration(milliseconds: 0), (){
      setState(() {
        showBody = true;
      });
     });
  }

  animatedBody(){
    return AnimatedCrossFade(
        firstChild: getBody(),
        secondChild: Container(),
        crossFadeState: showBody ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: Duration(milliseconds: ANIMATED_BODY_MS));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: animatedBody(),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: getButtons()
      );
  }

  getButtons(){
    return
      Container(
        margin: EdgeInsets.only(left: 15,  right: 15),
        child: Row(
          children: [
            CustomButton(
              width: 80, height: 40, 
              icon: Icons.play_arrow,
              title: "Play", fsize: 13,
              onTap: (){}
            ),
            SizedBox(width: 15,),
            Expanded(
              child: CustomButton(
                radius: 20,
                bgColor: secondary,
                title: "Adopt Me", fsize: 16,
                onTap: (){}
              ),
            )
          ],
        )
      );
  }

  getStack(){
    return
      Container(
        width: MediaQuery.of(context).size.width,
        height: 400,
        child: Stack(
          children: [
            CustomImage(data["image"], 
              width: MediaQuery.of(context).size.width, height: 400, 
              radius: 0, isShadow: false,
            ),
            SafeArea(child: 
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconBox(
                      child: Icon(Icons.arrow_back_ios_new, color: darker, size: 20,), 
                      bgColor: Colors.white.withOpacity(.6),
                      onTap: (){
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: GlassContainer(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                blur: 5,
                opacity: 0.65,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data["name"],
                        style: TextStyle(fontSize: 22, color: textColor, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Icon(Icons.place_outlined, color: darker, size: 13,),
                          SizedBox(width: 3,),
                          Text(data["location"], style: TextStyle(fontSize: 13, color: darker),),
                        ],
                      ),
                    ],
                  )
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              right: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FavoriteBox(
                  isFavorited:  data["is_favorited"],
                  onTap: (){
                    setState(() {
                      data["is_favorited"] = !data["is_favorited"];
                    });
                  }
                ,),
              ),
            ),
          ],
        ),
      );
  }

  getBody(){
    return
      SingleChildScrollView(
        child: Column(
          children: [
            getStack(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15,),
                getAttributtes(),
                SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: getOwerBox()
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    data["description"], 
                    style: TextStyle(height: 1.5),
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
            SizedBox(height: 80,)
          ],
        ),
      );
  }

  getAttributtes(){
    return
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(bottom: 5, left: 15),
        child: Row(
          children: [
            AttributeBox(label: "Sex", info: data["sex"],),
            AttributeBox(label: "Color", info: data["color"],),
            AttributeBox(label: "Age", info: data["age"],),
            AttributeBox(label: "Rate", info: data["rate"].toString(),)
          ]
        ),
      );
  }

  getOwerBox(){
    return
      Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          // color: Colors.white,
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: .5,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                CustomImage(profile, width: 40, height: 40,),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sangvaleap", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                      SizedBox(height: 3,),
                      Text("Pet's Owner",  style: TextStyle(fontSize: 12, color: Colors.grey),),
                    ],
                  ),
                ),
                IconBox(child: Icon(Icons.chat, color: Colors.white,), bgColor: green,),
                SizedBox(width: 15,),
                CustomButton(
                  width: 80, height: 37, bgColor: secondary,
                  icon: Icons.call,
                  title: "Call",
                  onTap: (){}
                ),
              ],
            ),
          ],
        ),
      );
  }

}