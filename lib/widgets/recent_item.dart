import 'package:flutter/material.dart';
import 'package:pet_app/theme/color.dart';
import 'package:pet_app/widgets/favorite_box.dart';
import 'custom_image.dart';

class RecentItem extends StatelessWidget {
  RecentItem({ Key? key, required this.data, this.onTap, this.onFavoriteTap }) : super(key: key);
  final data;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
            width: width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: shadowColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                CustomImage(data["image"], 
                  radius: 20,
                  width: 140, height: 140,
                ),
                SizedBox(width: 15,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(data["name"], maxLines: 1, overflow: TextOverflow.ellipsis, 
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                          FavoriteBox(
                            isFavorited: data["is_favorited"],
                            onTap: onFavoriteTap,
                          ),
                          SizedBox(width: 10)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.star, size: 18, color: yellow,),
                          SizedBox(width: 5,),
                          Text(data["rate"].toString(), style: TextStyle(fontSize: 15, color: primary, fontWeight: FontWeight.w500),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.fiber_manual_record, size: 7, color: labelColor,),
                          SizedBox(width: 2,),
                          Text(data["sex"], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: textColor, fontSize: 12),),
                          SizedBox(width: 5,),
                          Icon(Icons.fiber_manual_record, size: 7, color: labelColor,),
                          SizedBox(width: 2,),
                          Text(data["age"], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: textColor, fontSize: 12),),
                          SizedBox(width: 5,),
                          Icon(Icons.fiber_manual_record, size: 7, color: labelColor,),
                          SizedBox(width: 2,),
                          Text(data["color"], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: textColor, fontSize: 12),),
                          SizedBox(width: 5,),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.place_outlined, size: 13, color: labelColor,),
                          SizedBox(width: 3,),
                          Expanded(
                            child: 
                            Text(data["location"], maxLines: 1, overflow: TextOverflow.ellipsis, 
                              style: TextStyle(fontSize: 13, color: labelColor,),
                            )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
