import 'package:flutter/material.dart';
import 'package:pet_app/screens/auth_views/login_view.dart';
import 'package:pet_app/screens/auth_views/register_view.dart';

class PasswordResetView extends StatefulWidget {
  const PasswordResetView({Key? key}) : super(key: key);

  @override
  State<PasswordResetView> createState() => _PasswordResetViewState();
}

class _PasswordResetViewState extends State<PasswordResetView> {

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
                Text("Password Reset", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.brown),),
                const SizedBox(height: 20),
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
                      const SizedBox(height: 30),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12)),
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),)),
                          ),
                          child: Text("Password Reset", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
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
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegisterView()));
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12)),
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),)),
                          ),
                          child: Text("or Register"),
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
