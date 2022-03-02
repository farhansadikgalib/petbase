import 'package:flutter/material.dart';
import 'package:pet_app/widgets/custom_button.dart';

class PetBehaviorSearchView extends StatefulWidget {
  const PetBehaviorSearchView({Key? key}) : super(key: key);

  @override
  _PetBehaviorSearchViewState createState() => _PetBehaviorSearchViewState();
}

class _PetBehaviorSearchViewState extends State<PetBehaviorSearchView> {

  List<String> purpose = [
    "Anxiety",
    "Depression",
    "Autism",
    "ADHD",
    "Pain",
    "Hypertension",
    "Null",
  ];

  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.5,
      //   title: Text("Personality Search"),
      //   centerTitle: false,
      // ),
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
              _textField("Purpose 1", _controller1),
              const SizedBox(height: 10),
              _textField("Purpose 2", _controller2),
              const SizedBox(height: 10),
              _textField("Purpose 3", _controller3),
              const SizedBox(height: 10),
              _textField("Purpose 4", _controller4),
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

  Widget _textField(String hint, TextEditingController controller) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextField(
        onTap: () {
          _showBottomPopUp(context, controller);
        },
        controller: controller,
        readOnly: true,
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

  _showBottomPopUp(BuildContext context, TextEditingController controller) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Select purpose",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ...purpose.map(
                              (e) => ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  setState((){
                                    controller.text = e;
                                  },);
                                },
                                title: Text(e),
                              ),
                        ),
                        // ...purpose.map(
                        //       (e) => CheckboxListTile(
                        //     value: purpose.contains(e),
                        //     onChanged: (value) {
                        //       // _updateState(e);
                        //       // setState((){});
                        //     },
                        //     activeColor: Colors.black,
                        //     title: Text(e),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}


