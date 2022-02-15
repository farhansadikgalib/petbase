import 'package:flutter/material.dart';
import 'package:pet_app/utils/constant.dart';
import 'package:pet_app/widgets/custom_button.dart';

class PetSearchView extends StatefulWidget {
  const PetSearchView({Key? key}) : super(key: key);

  @override
  _PetSearchViewState createState() => _PetSearchViewState();
}

class _PetSearchViewState extends State<PetSearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text("Personality Search"),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          Column(
            children: [
              // CustomButton(
              //   onTap: () {
              //     Navigator.pushNamedAndRemoveUntil(context, rootAppRoute, (route) => false, arguments: {"data" : 1});
              //   },
              //   title: "Search By Breed",
              //   bgColor: Colors.green,
              //   radius: 50,
              //   width: 200,
              // ),
              Text('Our propriety matching method suggests breeds uniquely suited to you. '
                  'To "Find your best friend", choose a need or purpose below. '
                  'Select "null" instead of leaving fields blank.'),

              const SizedBox(height: 30),
              _textField("Purpose 1"),
              const SizedBox(height: 10),
              _textField("Purpose 2"),
              const SizedBox(height: 10),
              _textField("Purpose 3"),
              const SizedBox(height: 10),
              _textField("Purpose 4"),
              const SizedBox(height: 30),
              CustomButton(
                onTap: () {},
                title: "Let's do it",
                bgColor: Colors.green,
                radius: 50,
                width: 200,
              ),

            ],
          )
        ],
      ),
    );
  }

  Widget _textField(String hint) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            hintText: hint,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 0.2)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 0.5)
            )
        ),
      ),
    );
  }
}
