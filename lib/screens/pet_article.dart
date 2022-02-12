import 'package:flutter/material.dart';

class PetArticle extends StatefulWidget {
  const PetArticle({Key? key}) : super(key: key);

  @override
  _PetArticleState createState() => _PetArticleState();
}

class _PetArticleState extends State<PetArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Pet Article"),
      ),
    );
  }
}
