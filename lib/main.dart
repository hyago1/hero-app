
import 'package:flutter/material.dart' hide Hero;
import 'package:projetopdm/ui/pages/TelaHeros.dart';
import 'package:projetopdm/ui/pages/TelaCards.dart';
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
      home: const Teste2(),
    );
  }
}




class Teste2 extends StatefulWidget {
  const Teste2({super.key});

  @override
  State<Teste2> createState() => _Teste2State();
}

class _Teste2State extends State<Teste2> {
  int pageIndex = 0 ;

  final List<Widget> frames = <Widget>[
    TelaHeros(),
    TelaCards(),
    TelaBatalhar(),

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
        bottomNavigationBar: NavigationBar(destinations: <Widget>[
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
        
        bottomNavigationBar: NavigationBar(destinations: <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.notifications_sharp)),
            label: 'Notifications',

          ),
          NavigationDestination(
            icon: Badge(label: Text('2'), child: Icon(Icons.messenger_sharp)),
            label: 'Messages',
          ),
        ],),
        
        
        
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
                        MaterialPageRoute(builder: (context) => TelaHeros()),
                      );
                    },child: Text("Heróis"),
                    )
                  ),
                  Container(
                    margin: EdgeInsets.all(25),
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TelaCards()),
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
                        MaterialPageRoute(builder: (context) => TelaBatalhar()),
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
