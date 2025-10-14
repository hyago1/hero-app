
import 'package:flutter/material.dart' hide Hero;
import 'package:projetopdm/pages/batalhar.dart';
import 'package:projetopdm/pages/cards.dart';
import 'package:projetopdm/pages/herois.dart';

import 'package:projetopdm/pages/minhasCarta.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.dark()
      ),
      home: const Home(), 
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:ColorScheme.dark()
      ),
      home: Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(
          title: Text("Projeto PDM - Hero"),
        ),
        body:
            Center(
              child:
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(25),
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Herois()),
                      );
                    },child: Text("Heróis"),
                    )
                  ),
                  Container(
                    margin: EdgeInsets.all(25),
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Cards()),
                      );
                    },child: Text("Card Diário"),),
                  ),
                  Container(
                    margin: EdgeInsets.all(25),
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MinhasCartas()),
                      );
                    },child: Text("Minhas Cartas"),),
                  ),
                  Container(
                    margin: EdgeInsets.all(25),
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Batalhar()),
                      );
                    },child: Text("Batalhar"),),
                  ),
                ],
              ),
            )
      )
    );
  }
}
