import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(Signup());
}

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
      ) // Start with FirstScreen
    );
  }
}