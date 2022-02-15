import 'package:flutter/material.dart';
import 'package:pet_app/widgets/custom_button.dart';

class VetSearchView extends StatefulWidget {
  const VetSearchView({Key? key}) : super(key: key);

  @override
  _VetSearchViewState createState() => _VetSearchViewState();
}

class _VetSearchViewState extends State<VetSearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text("Veterinarian Search"),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              _textField("Name"),
              const SizedBox(height: 10),
              _textField("Zip Code"),
              const SizedBox(height: 30),
              CustomButton(
                onTap: () {},
                title: "Let's do it",
                bgColor: Colors.green,
                radius: 50,
                width: 200,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _textField(String hint) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
