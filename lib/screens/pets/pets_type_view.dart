import 'package:flutter/material.dart';
import 'package:pet_app/screens/pets/pets_breed_view.dart';
import 'package:pet_app/theme/color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PetsTypeView extends StatefulWidget {
  const PetsTypeView({Key? key}) : super(key: key);

  @override
  _PetsTypeViewState createState() => _PetsTypeViewState();
}

class _PetsTypeViewState extends State<PetsTypeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pets Browse"),
      ),
      body: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        padding: EdgeInsets.all(20),
        children: [
          _imageContainer("assets/icons/dog.svg", "Dog"),
          _imageContainer("assets/icons/cat.svg", "Cat"),
          _imageContainer("assets/icons/parrot.svg", "Parrot"),
          _imageContainer("assets/icons/rabbit.svg", "Rabbit"),
          _imageContainer("assets/icons/fish.svg", "Fish"),
          _imageContainer("assets/icons/turtle.svg", "Turtle"),
        ],
      ),
    );
  }

  Widget _imageContainer(String image, String name) {
    return GestureDetector(
      onTap: () async{
        Navigator.push(context, MaterialPageRoute(builder: (context)=>PetsBreedView(pet: image,)));
      },
      child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: Colors.green),
            color: Theme.of(context).canvasColor,
          ),
          child: Column(
            children: [
              Expanded(child: SvgPicture.asset(image, color: Theme.of(context).primaryColor)),
              SizedBox(height: 10),
              Text(name, maxLines: 1, overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Theme.of(context).primaryColor),
              ),
            ],
          )
      ),
    );
  }
}
