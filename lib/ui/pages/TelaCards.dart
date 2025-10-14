import 'package:flutter/material.dart';

class TelaCards extends StatelessWidget {
  const TelaCards({super.key});

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