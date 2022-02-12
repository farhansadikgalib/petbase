import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,),
          child: Column(
            children: [
              Image.asset("assets/icons/appLogo.png", scale: 2,),
              SizedBox(height: 20,),
              Text("Whether you’ve come to petBase to adopt or to find excellent animal care,"
                  " we’ll be here for you: petBase is your partner for every "
                  "step on your companion animal journey. Select the Vet and services you like and"
                  " we will put your customer profile in their online petBase store.Expect many new features in "
                  "Spring “Find Your Best Friend”"),
            ],
          ),
        ),
      ),

    );
  }
}
