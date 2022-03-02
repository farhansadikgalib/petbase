import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/screens/pets/breed_detail_view.dart';
import 'package:pet_app/theme/color.dart';

class PetsBreedView extends StatefulWidget {
  final String pet;
  const PetsBreedView({Key? key, required this.pet}) : super(key: key);

  @override
  _PetsBreedViewState createState() => _PetsBreedViewState();
}

class _PetsBreedViewState extends State<PetsBreedView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Breeds"),
      ),
      body: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        padding: EdgeInsets.all(15),
        children: [
          _imageContainer("Akita"),
          _imageContainer("American Bulldog"),
          _imageContainer("Japanese spitz"),
          _imageContainer("German Shepard"),
          _imageContainer("Pug"),
          _imageContainer("Alaskan Terrier"),
          _imageContainer("Hound"),
        ],
      ),
    );
  }

  Widget _imageContainer(String name) {
    return GestureDetector(
      onTap: () async{
        Navigator.push(context, MaterialPageRoute(builder: (context)=>BreedDetailView(breedValue: name,)));
      },
      child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: Colors.green),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            children: [
              Expanded(child: SvgPicture.asset(widget.pet, color: Theme.of(context).primaryColor)),
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
