import 'package:flutter/material.dart';
import 'package:pet_app/screens/pets/nearby_pets_view.dart';
import 'package:pet_app/theme/color.dart';
import 'package:pet_app/utils/data.dart';

class BreedDetailView extends StatefulWidget {
  final String breedValue;
  const BreedDetailView({Key? key, required this.breedValue}) : super(key: key);

  @override
  _BreedDetailViewState createState() => _BreedDetailViewState();
}

class _BreedDetailViewState extends State<BreedDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25),),
              child: Stack(
                children: [
                  Image.network(
                    pets[0]["image"],
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 15,
                    left: 15,
                    child: SafeArea(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).backgroundColor,
                                blurRadius: 40,
                                spreadRadius: 10,
                              )
                            ],
                          ),
                          child: Icon(Icons.arrow_back_ios, color: Theme.of(context).cardColor,),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 70,
                    left: 15,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).backgroundColor,
                            blurRadius: 40,
                            spreadRadius: 10,
                          )
                        ],
                      ),
                      child: Text(
                        widget.breedValue,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700, color: Theme.of(context).cardColor,),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 10,
                    right: 15,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NearbyPetsView()));
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(blue),
                      ),
                      child: Text(
                        "Search Nearby for this!",
                        style: TextStyle(
                            fontSize: 12, color: Theme.of(context).cardColor,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Character", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),),
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"

                      " recently with desktop publishing software like Aldus PageMaker including versions of"
                      " Lorem Ipsum."),

                  const SizedBox(height: 20,),
                  Text("Temperament", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),),
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      " recently with desktop publishing software like Aldus PageMaker including versions of"
                      " Lorem Ipsum."),
                  const SizedBox(height: 20,),
                  Text("Training", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),),
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
                      " when an unknown printer took a galley of type and scrambled it to make a type"
                      " specimen book. It has survived not only five centuries, but also the leap into "
                      "electronic typesetting, remaining essentially unchanged. It was popularised in the "
                      "1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more"
                      " recently with desktop publishing software like Aldus PageMaker including versions of"
                      " Lorem Ipsum."),
                  const SizedBox(height: 20,),
                  Text("Activity", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),),
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more"
                      " recently with desktop publishing software like Aldus PageMaker including versions of"
                      " Lorem Ipsum."),
                  const SizedBox(height: 20,),
                  Text("Coat", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),),
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
                      " when an unknown printer took a galley of type and scrambled it to make a type"
                      "1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more"
                      " recently with desktop publishing software like Aldus PageMaker including versions of"
                      " Lorem Ipsum."),
                  const SizedBox(height: 20,),
                  Text("Care", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),),
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
                      " desktop publishing software like Aldus PageMaker including versions of"
                      " Lorem Ipsum."),
                  const SizedBox(height: 20,),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
