import 'package:flutter/material.dart';
import 'package:pet_app/theme/color.dart';

class CustomTextBox extends StatelessWidget {
  CustomTextBox({ Key? key, this.hint = "", this.prefix, this.suffix, this.controller, this.readOnly = false}) : super(key: key);
  final String hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool readOnly;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: red,
      textAlignVertical: TextAlignVertical.center,
      readOnly: readOnly,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffix,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        hintText: hint,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical:0 ),
        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
      ),
    );
    // return Container(
    //     alignment: Alignment.center,
    //     height: 40,
    //     decoration: BoxDecoration(
    //       color: textBoxColor,
    //       border: Border.all(color: textBoxColor),
    //       borderRadius: BorderRadius.circular(10),
    //       boxShadow: [
    //         BoxShadow(
    //           color: shadowColor.withOpacity(0.05),
    //           spreadRadius: .5,
    //           blurRadius: .5,
    //           offset: Offset(0, 1), // changes position of shadow
    //         ),
    //       ],
    //     ),
    //     child: TextField(
    //       textAlignVertical: TextAlignVertical.center,
    //       readOnly: readOnly,
    //       controller: controller,
    //       decoration: InputDecoration(
    //         prefixIcon: prefix,
    //         suffixIcon: suffix,
    //         border: InputBorder.none,
    //         hintText: hint,
    //         hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
    //     ),
    //   );
  }
}
