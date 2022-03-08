import 'package:flutter/material.dart';
import 'package:pet_app/utils/data.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  OutlineInputBorder _textDecoration = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(width: 1, color: Colors.green),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      profile,
                      height: 90,
                      width: 90,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Peter",
                            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                            isDense: true,
                            enabledBorder: _textDecoration,
                            focusedBorder: _textDecoration,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Parker",
                            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                            isDense: true,
                            enabledBorder: _textDecoration,
                            focusedBorder: _textDecoration,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "I am Peter. I am an animal lover. I love dogs. I am an animal lover.",
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  isDense: true,
                  enabledBorder: _textDecoration,
                  focusedBorder: _textDecoration,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Phone",
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  isDense: true,
                  enabledBorder: _textDecoration,
                  focusedBorder: _textDecoration,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "425. Main st",
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  isDense: true,
                  enabledBorder: _textDecoration,
                  focusedBorder: _textDecoration,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "New York",
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  isDense: true,
                  enabledBorder: _textDecoration,
                  focusedBorder: _textDecoration,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "State",
                        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        isDense: true,
                        enabledBorder: _textDecoration,
                        focusedBorder: _textDecoration,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    flex: 2,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "10044",
                        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        isDense: true,
                        enabledBorder: _textDecoration,
                        focusedBorder: _textDecoration,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20)),
                ),
                child: Text("Save"),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20)),
                ),
                child: Text("Request Further Info (check email)"),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
