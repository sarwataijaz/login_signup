import 'dart:async';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_signup/signup.dart';
Timer? _debounce;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool visibility = true;
  bool isEnabled = true;
  bool isTapped = false;

  void _toggleButton() {
    if (_debounce?.isActive ?? false) _debounce!.cancel(); // if multiple tap occuring, cancel the current execution
    _debounce = Timer(Duration(milliseconds: 200), () {
      setState(() {
        isTapped = !isTapped;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true, // Set to true to resize when the keyboard is displayed
        body:SingleChildScrollView(
          child: Container(
              child: Column(
                children: [
                  Center(child: Image.asset("assets/images/img.png", height: 300)),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("LOGIN", style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left:20.0, right:20.0, top:2.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Email",
                              contentPadding: EdgeInsets.all(5),
                              prefixIcon: Icon(Icons.email_outlined, color: Colors.blueAccent),
                              border: OutlineInputBorder( // Outline border
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 5.0),
                      child: TextField(
                        obscureText: visibility,
                        decoration: InputDecoration(
                          hintText: "Password",
                          contentPadding: EdgeInsets.all(5),
                          prefixIcon: Icon(Icons.lock_outline, color: Colors.blueAccent),
                          suffixIcon: IconButton(
                            onPressed: () => {
                              setState(() {
                                visibility = !visibility;
                              }
                              )
                            },
                            icon: Icon (
                              visibility ? Icons.visibility_off : Icons.visibility
                            )
                          ),
                          border: OutlineInputBorder( // Outline border
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top: 2.0, left: 25.0),
                           child: Container(
                             width: 40,
                             height: 20,
                             alignment: Alignment.centerLeft,
                             decoration: BoxDecoration(
                               color: (isTapped) ? Colors.blue : Colors.grey,
                               borderRadius: BorderRadius.vertical(
                              top: Radius.circular(100), // Adjust the radius for a more cylindrical look
                              bottom: Radius.circular(100),
                              ),
                             ),
                             child: Stack(
                               children: [
                               Positioned(
                               left: (isTapped) ? null : 0,
                               right: (isTapped) ? 0 : null,
                               top: 0,
                             child: InkWell(
                               onTap: _toggleButton,
                               child: Container(
                                 width: 20,
                                 height: 20,
                                 alignment: (isTapped) ? Alignment.topRight: Alignment.topLeft,
                                 decoration: BoxDecoration(
                                   shape: BoxShape.circle,
                                   color: Colors.white,
                                   border: Border.all(
                                     color: Colors.white60,
                                     width: 2,
                                   )
                                 ),
                               ),
                              ),
                             ),
                             ]
                           ),
                           ),
                         ),
                     Padding(
                       padding: const EdgeInsets.only(left: 2),
                       child: Text("Remember me", style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black
                               ),
                           ),
                     ),
                       ],
                     ),
                     Container(
                         alignment: Alignment.centerRight,
                           child: TextButton(
                             onPressed: () => {
          
                             },
                             style: TextButton.styleFrom(
                                 foregroundColor: Colors.black, // text color
                             ),
                             child: Text("Forgot Password?"),
                           ),
                        ),
                   ],
                 ),
                  Column(
                    children: [
                      OutlinedButton(onPressed: (){
          
                      }, child: Text("LOGIN"),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.black, // text color
                          fixedSize: Size(200, 50),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text("OR", style: TextStyle(
                          fontSize: 12
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text("Log in with", style: TextStyle(
                            fontSize: 12
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0, right:8.0),
                        child: Image.asset("assets/images/logos.png"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          TextButton(
                            child: Text("Register now"),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.blueAccent
                            ),
                            onPressed:() {
                              Navigator.push( // This method is used to navigate to a new route (screen). It takes the current BuildContext and a Route object.
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: Duration(seconds: 1),
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) => Signup(),
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
                ],
              ),
            ),
        ),
      )
    );
  }
}
