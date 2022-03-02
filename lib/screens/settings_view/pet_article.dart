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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            title: Text("Articles"),
            centerTitle: false,
          ),

          SliverList(delegate: SliverChildListDelegate([])),
        ],
      ),
    );
  }
}
