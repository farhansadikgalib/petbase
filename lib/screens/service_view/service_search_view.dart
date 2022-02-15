import 'package:flutter/material.dart';
import 'package:pet_app/widgets/custom_button.dart';

class ServiceSearchView extends StatefulWidget {
  const ServiceSearchView({Key? key}) : super(key: key);

  @override
  _ServiceSearchViewState createState() => _ServiceSearchViewState();
}

class _ServiceSearchViewState extends State<ServiceSearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text("Service Search"),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              _textField("Service name"),
              const SizedBox(height: 10),
              _textField("Type"),
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
