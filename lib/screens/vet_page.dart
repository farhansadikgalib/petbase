import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pet_app/theme/color.dart';
import 'package:pet_app/widgets/custom_button.dart';
import 'package:image_picker/image_picker.dart';

class VetPage extends StatefulWidget {
  const VetPage({Key? key}) : super(key: key);

  @override
  _VetPageState createState() => _VetPageState();
}

class _VetPageState extends State<VetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            centerTitle: false,
            title: Text("Inform Your Vet", style: TextStyle(color: primary),),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            ],
          ),
          SliverList(delegate: SliverChildListDelegate([
            Column(
              children: [
                SizedBox(height: 10),
                _imageGridView(),
                SizedBox(height: 10),
                _descriptionTextField(),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 15,  right: 15),
                  child: CustomButton(
                      // width: 80, height: 40,
                      // icon: Icons.play_arrow,
                      bgColor: Colors.green,
                      title: "Let's do it!",
                      fsize: 13,
                      radius: 30,
                      onTap: (){

                      }
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text("Comments and Images will be transmitted by email to your Primary Care"
                      " Veterinarian (PCV). See your email for invitation to schedule an appointment. "
                      "Check the PCV:", style: TextStyle(fontSize: 12),),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 15,  right: 15),
                  child: CustomButton(
                      width: 130,
                      height: 30,
                      title: "PCV Check",
                      fsize: 10,
                      radius: 5,
                      onTap: (){

                      }
                  ),
                ),
                SizedBox(height: 80),
              ],
            ),
          ]),)
        ],
      ),
    );
  }

  Widget _imageGridView() {
    return Column(
      children: [
        Text("Upload Image", style: TextStyle(fontWeight: FontWeight.w500),),
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          padding: EdgeInsets.all(15),
          children: [
            _imageContainer("Entire", 0),
            _imageContainer("Face", 1),
            _imageContainer("Genitalia", 2),
            _imageContainer("Paws/Feet", 3),
            _imageContainer("Nose/Teeth", 4),
            _imageContainer("Side", 5),
          ],
        ),
      ],
    );
  }

  String? entire;
  String? face;
  String? genitalia;
  String? paws;
  String? noseTeeth;
  String? side;

  Widget _imageContainer(String label, int index) {
    return GestureDetector(
      onTap: () async{
        final ImagePicker _picker = ImagePicker();
        final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
        if(image != null) {
          if(index == 0) {
            entire = image.path;
          } else if(index == 1) {
            face = image.path;
          } else if(index == 2) {
            genitalia = image.path;
          } else if(index == 3) {
            paws = image.path;
          } else if(index == 4) {
            noseTeeth = image.path;
          } else if(index == 5){
            side = image.path;
          }
          setState(() {});
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.2)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
            child: index == 0 && entire != null
                ? Image.file(
                    File(entire!),
                    fit: BoxFit.cover,
                  )
                : index == 1 && face != null
                    ? Image.file(
                        File(face!),
                        fit: BoxFit.cover,
                      )
                    : index == 2 && genitalia != null
                        ? Image.file(
                            File(genitalia!),
                            fit: BoxFit.cover,
                          )
                        : index == 3 && paws != null
                            ? Image.file(
                                File(paws!),
                                fit: BoxFit.cover,
                              )
                            : index == 4 && noseTeeth != null
                                ? Image.file(
                                    File(noseTeeth!),
                                    fit: BoxFit.cover,
                                  )
                                : index == 5 && side != null
                                    ? Image.file(
                                        File(side!),
                                        fit: BoxFit.cover,
                                      )
                                    : Center(
                                        child: Text(label),
                                      ),
          )
      ),
    );
  }

  Widget _descriptionTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Text("Pre-Exam Pet Owner Inputs", style: TextStyle(fontWeight: FontWeight.w500),),
          SizedBox(height: 5,),
          TextField(
            textInputAction: TextInputAction.done,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Upload pictures above and your observations and concerns here.",
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
        ],
      ),
    );
  }
}
