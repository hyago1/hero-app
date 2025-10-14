import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Cards"),),
      body:Center(
        child: Text("Cards"),
      ),

      );

  }


}