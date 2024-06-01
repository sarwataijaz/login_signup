import 'dart:async';
import 'package:login_signup/main.dart';
import 'package:login_signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

void main() {
  runApp(Signup());
}

class Signup extends StatelessWidget {
  const Signup({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignupScreen(title: "Signup Screen"),
    );
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key, required this.title});

  final String title;

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool visibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child:
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Image.asset("assets/images/signup_logo.png", height: 300),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("SIGN UP",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 5.0),
              child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "First Name",
                contentPadding: EdgeInsets.only(left:5.0, right:5.0, top:10.0),
                prefixIcon: Icon(Icons.person, color: Colors.blueAccent),
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 5.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Last Name",
                  contentPadding: EdgeInsets.only(left:5.0, right:5.0, top:10.0),
                  prefixIcon: Icon(Icons.person, color: Colors.blueAccent),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 5.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Email",
                  contentPadding: EdgeInsets.only(left:5.0, right:5.0, top:10.0),
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.blueAccent),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 5.0),
              child: TextField(
                obscureText: visibility,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Password",
                  contentPadding: EdgeInsets.only(left:5.0, right:5.0, top:10.0),
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.blueAccent),
                  suffixIcon: IconButton(onPressed:() => {
                  setState(() {
                  visibility = !visibility;
                    }
                  )
                 }, icon: Icon(
                    (visibility) ? Icons.visibility_off : Icons.visibility
                  ),
                ),
               ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 5.0),
              child: TextField(
                obscureText: visibility,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Confirm Password",
                  contentPadding: EdgeInsets.only(left:5.0, right:5.0, top:10.0),
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.blueAccent),
                  suffixIcon: IconButton(onPressed:() => {
                    setState(() {
                      visibility = !visibility;
                    }
                    )
                  }, icon: Icon(
                      (visibility) ? Icons.visibility_off : Icons.visibility
                  ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:10.0),
              child: OutlinedButton(onPressed: (){
              
              }, child: Text("LOGIN"),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black, // text color
                  fixedSize: Size(200, 50),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?", style: TextStyle(
                  color: Colors.white,
                ),),
                TextButton(
                  child: Text("Login"),
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  onPressed:() {
                    Navigator.push( // This method is used to navigate to a new route (screen). It takes the current BuildContext and a Route object.
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(seconds: 1),
                        pageBuilder: (context, animation,
                            secondaryAnimation) => MyApp(),
                        transitionsBuilder: (context, animation,
                            secondaryAnimation, child) {
                          return FadeThroughTransition(
                            animation: animation,
                            secondaryAnimation: secondaryAnimation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
