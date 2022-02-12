
import 'package:flutter/material.dart';
import 'package:pet_app/theme/color.dart';
import 'package:pet_app/utils/constant.dart';
import 'package:pet_app/utils/data.dart';
import 'package:pet_app/widgets/category_item.dart';
import 'package:pet_app/widgets/custom_textbox.dart';
import 'package:pet_app/widgets/icon_box.dart';
import 'package:pet_app/widgets/recent_item.dart';

class PetPage extends StatefulWidget {
  const PetPage({ Key? key }) : super(key: key);

  @override
  _PetPageState createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  @override
  Widget build(BuildContext context) {
    return 
    CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            title: getHeader()
          ),
          SliverToBoxAdapter(
            child: getBody()
          )
        ],
      );
  }

  getHeader(){
    return
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Pets",
              style: TextStyle(fontSize: 28, color: Colors.black87, fontWeight: FontWeight.w600)
            ),
          ],
        ),
      );
  }

  getBody(){
    return
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextBox(hint: "Search", prefix: Icon(Icons.search, color: Colors.grey), )
                  ),
                  SizedBox(width: 10,),
                  IconBox(child: Icon(Icons.filter_list_rounded, color: Colors.white), bgColor: secondary, radius: 10,)
                ],
              ),
            ),
            SizedBox(height: 20,),
            listCategories(),
            SizedBox(height: 20,),
            getPets(),
            SizedBox(height: 55),
          ],
        ),
      );
  }
  
  int selectedCategory = 0;
  listCategories(){
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
    return
      SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 5, left: 15, right: 15),
        child: Column(
          children: List.generate(pets.length, 
            (index) => Container(
              margin: EdgeInsets.only(bottom: 15),
              child: RecentItem(
                onTap: (){
                  Navigator.of(context).pushNamed(petDetailRoute, arguments: {"data" : pets[index]});
                },
                data: pets[index],
                onFavoriteTap: (){
                  setState(() {
                    pets[index]["is_favorited"] = ! pets[index]["is_favorited"];
                  });
                },
              ),
            )
          )
        ),
      );
  }


}