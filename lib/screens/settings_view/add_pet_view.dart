import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_app/theme/color.dart';

class AddPetView extends StatefulWidget {
  const AddPetView({Key? key}) : super(key: key);

  @override
  _AddPetViewState createState() => _AddPetViewState();
}

class _AddPetViewState extends State<AddPetView> {

  String? petImageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Pet"),
        centerTitle: false,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () async{
                    final ImagePicker _picker = ImagePicker();
                    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                    if(image != null) {
                      petImageUrl = image.path;
                      setState(() {});
                    }
                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.2)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: petImageUrl != null
                            ? Image.file(
                                File(petImageUrl!),
                                fit: BoxFit.cover,
                              )
                            : Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Click to Upload", style: TextStyle(fontSize: 12),),
                                ),
                              ),
                      )
                  ),
                ),
              ),
              const SizedBox(height: 25),
              _textField("Name"),
              const SizedBox(height: 10),
              _textField("Type"),
              const SizedBox(height: 10),
              _textField("Breed"),
              const SizedBox(height: 10),
              _textField("Age"),
              const SizedBox(height: 10),
              _textField("Fav Food or Toy"),
              const SizedBox(height: 40),

              TextButton(
                onPressed: () {},
                child: Text("Done"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                ),
              ),
            ],
          ),
        ),
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
