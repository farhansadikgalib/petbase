import 'package:flutter/material.dart';
import 'package:pet_app/screens/auth_views/password_reset_view.dart';
import 'package:pet_app/screens/auth_views/register_view.dart';
import 'package:pet_app/screens/root_app.dart';


class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

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
                Text("by Petbase", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text("Sign in", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.brown),),
                const SizedBox(height: 10),
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
                      const SizedBox(height: 15),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Password",
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
                      const SizedBox(height: 15),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RootApp()));
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12)),
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),)),
                          ),
                          child: Text("Sign in", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegisterView()));
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12)),
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),)),
                          ),
                          child: Text("Go to Register"),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
