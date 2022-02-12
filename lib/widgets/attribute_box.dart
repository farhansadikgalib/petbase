import 'package:flutter/material.dart';
import 'package:pet_app/theme/color.dart';

class AttributeBox extends StatelessWidget {
  AttributeBox({ Key? key, required this.info, this.label = "", this.icon, this.bgColor = Colors.white, this.color = secondary}) : super(key: key);
  final IconData? icon;
  final String info;
  final String label;
  final Color bgColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return 
      Container(
        width: 100, height: 90,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.01),
              spreadRadius: .5,
              blurRadius: .5,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children : [
            Visibility(
              visible: icon != null ? true : false,
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 20,),
              ),
            ),
            Text(label, maxLines: 1, style: TextStyle(fontSize: 13, color: color),),
            SizedBox(height: 10,),
            Text(info, maxLines: 1, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
          ]
        ),
      );
  }
}
