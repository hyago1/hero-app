
import 'package:flutter/material.dart' hide Hero;
import 'package:projetopdm/ui/pages/TelaHeros.dart';
import 'package:projetopdm/ui/pages/TelaDailyCards.dart';
import 'package:projetopdm/ui/pages/TelaBatalhar.dart';

import 'package:projetopdm/ui/pages/TelaMyCards.dart';

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




class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0 ;

  final List<Widget> frames = <Widget>[
    TelaHeros(),
    TelaDailyCards(),
    TelaMyCards(),
    TelaBatalhar(),
  ];

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
          backgroundColor: Colors.black26,
          appBar: AppBar(
            title: Text("Projeto PDM - Hero"),
          ),
          body:
          Center(
            child:
            frames.elementAt(pageIndex)
          ),
          bottomNavigationBar: NavigationBar(

            destinations: <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Heros',
          ),
          NavigationDestination(
            icon:  Icon(Icons.today),
            selectedIcon: Icon(Icons.today_sharp),
            label: 'Card Diário',
          ),
          NavigationDestination(
            icon: Badge(label: Text('2'), child: Icon(Icons.credit_card_rounded)),
            label: 'Meus Cards',
          ),
          NavigationDestination(
            icon: Icon(Icons.shield_outlined),
            label: 'Batalhar',
          ),
        ],
          selectedIndex: pageIndex,
          onDestinationSelected: (value) {
            setState(() {
              pageIndex = value;
            });
            print(value);
          },

        ),

      )
      ;
  }
}
