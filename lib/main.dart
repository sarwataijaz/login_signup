import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


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

  bool visibility = false;
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: Colors.blueGrey,
        body: Center(
          child: Container(
            child: Column(
              children: [
                Image.asset("assets/images/img.png", height: 300),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("LOGIN", style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
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
                Padding(
                  padding: const EdgeInsets.only(left:20.0, right: 20.0, bottom: 20.0, top: 2.0),
                  child: TextField(
                    obscureText: visibility,
                    decoration: InputDecoration(
                      hintText: "Password",
                      contentPadding: EdgeInsets.all(5),
                      prefixIcon: Icon(Icons.password_rounded, color: Colors.blueAccent),
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
               Padding(
                 padding: const EdgeInsets.only(top: 2),
                 child: TextButton(
                   onPressed: () => {

                   },
                   style: TextButton.styleFrom(
                       textStyle: TextStyle(color: Colors.black)
                   ),
                   child: Text("Forgot Password?"),
                 ),
               ),
                OutlinedButton(onPressed: (){

                }, child: Text("LOGIN"),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                      textStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
