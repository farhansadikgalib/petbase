import 'package:flutter/material.dart';
import 'package:pet_app/screens/auth_views/login_view.dart';
import 'package:pet_app/screens/auth_views/password_reset_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10.0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Image.asset("assets/icons/appLogo.png", scale: 2),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text("Find Your Best Friend. Thanks for subscribing! Tell us about yourself so we can find pets, vets and"
                    " services for you.", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.brown), textAlign: TextAlign.center,),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Your Email",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade400
                          ),
                          prefixIcon: Icon(Icons.email_outlined, color: Colors.grey,),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Zip Code",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400,
                          ),
                          prefixIcon: Icon(Icons.lock_outline_sharp, color: Colors.grey,),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),

                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "First Name",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade400
                          ),
                          prefixIcon: Icon(Icons.person_outline, color: Colors.grey,),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Last Name",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade400
                          ),
                          prefixIcon: Icon(Icons.person_outline, color: Colors.grey,),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Zip Code",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400,
                          ),
                          prefixIcon: Icon(Icons.map_outlined, color: Colors.grey,),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),

                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12)),
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),)),
                          ),
                          child: Text("Register", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginView()));
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12)),
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),)),
                          ),
                          child: Text("got to Sign in"),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PasswordResetView()));
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12)),
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),)),
                          ),
                          child: Text("or Password Reset"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text("by Petbase", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
