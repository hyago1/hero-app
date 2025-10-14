import 'package:flutter/material.dart';

class Herois extends StatelessWidget {
  const Herois({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Herois"),),
      body:Center(
        child: Text("Herois"),
      ),
    );
  }
}