import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {

  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            title: Text("Report"),
          ),

          SliverPadding(
            padding: EdgeInsets.all(15),
            sliver: SliverList(delegate: SliverChildListDelegate([
              Text("Upload a Screenshot", textAlign: TextAlign.center,),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: () async{
                    final ImagePicker _picker = ImagePicker();
                    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                    if(image != null) {
                      imageUrl = image.path;
                      setState(() {});
                    }
                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.2),
                        color: Theme.of(context).cardColor,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: imageUrl != null
                            ? Image.file(
                          File(imageUrl!),
                          fit: BoxFit.cover,
                        )
                            : Center(
                          child: Text("Click to Upload"),
                        ),
                      )
                  ),
                ),
              ),

              const SizedBox(height: 25,),

              Text("What's the problem?", textAlign: TextAlign.center,),
              const SizedBox(height: 15,),
              _descriptionTextField(),
              const SizedBox(height: 15,),

              TextButton(
                onPressed: () {},
                child: Text("Send"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                ),
              ),

              const SizedBox(height: 5,),

              Text("Comments and Images will be transmitted by email to us."
                  " Check your email for updates and replies. ", style: TextStyle(fontSize: 12),),

            ])),
          ),
        ],
      ),
    );
  }

  Widget _descriptionTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        textInputAction: TextInputAction.done,
        maxLines: 4,
        decoration: InputDecoration(
            hintText: "Enter your observations and concerns.",
            hintStyle: TextStyle(fontSize: 14),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 0.2)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 0.5)
            ),
          filled: true,
          fillColor: Theme.of(context).cardColor,
        ),
      ),
    );
  }
}
