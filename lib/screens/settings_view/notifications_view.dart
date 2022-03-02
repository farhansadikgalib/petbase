import 'package:flutter/material.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  _NotificationsViewState createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Updates"),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text("You can take your eye off the ball"),
              const SizedBox(height: 30,),
              Image.asset("assets/cat.gif"),
              const SizedBox(height: 30,),
              Text("We will remind you when  something pops up, OK?  "
                  "(Actually we will do a lot in the background)"),
              const SizedBox(height: 20,),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text("I accept"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
