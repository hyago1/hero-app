import 'package:flutter/material.dart';

class MinhasCartas extends StatelessWidget {
  const MinhasCartas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Minhas Cartas"),),
      body:Center(
        child: Text("MinhasCartas"),
      ),
    );
  }
}