import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projetopdm/ui/pages/TelaHeroDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/fetchApiHero.dart';
import '../../model/hero.dart';






class TelaDailyCards extends StatefulWidget {
  const TelaDailyCards({super.key});
  @override
  State<TelaDailyCards> createState() => _TelaDailyCardsState();
}


class _TelaDailyCardsState extends State<TelaDailyCards> {
  
  List<HeroModel> heroes = [];
  final now = DateTime.now().day;
  int id = 0;
  
  
  void initState() {
    super.initState();
    _loadHeroes();
  }

  Future<void> _loadHeroes() async {
    List<HeroModel> fetchedHeroes = await fetch();
    print(fetchedHeroes);
    setState(() {
      heroes = fetchedHeroes; // Aqui atualiza o estado do array inserindo os Herois nele
    });
    saveData();
  }
  
  
  int random(){
    var intValue = Random().nextInt(560);

    return intValue;
  }

  Future<void> saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = await readData();
    if(data!=now.toString()){
      await prefs.setString("data" , now.toString());
      await prefs.setString("idHero" , random().toString());
    }else{
      print("ainda  é dia $now e o hero é id: $id" );
    }
 }
  Future<String?> readData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('data');
    String? hero = prefs.getString('idHero');
    int idint = int.parse(hero!);
    id = idint;
    return data;
  }




  @override
  Widget build(BuildContext context) {

    if (id==0) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body:

      Column(
        children: [
          Expanded(
            child: TelaHeroDetails(image: heroes[id].imageUrl, name: heroes[id].name, durability: heroes[id].durability.toString(), speed: heroes[id].speed.toString(), combat: heroes[id].combat.toString(), power: heroes[id].power.toString(), intelligence: heroes[id].intelligence.toString(), strength: heroes[id].strength.toString()),
          ),

        ElevatedButton(

          onPressed: () { },
              child: Text('Salvar'),
          ),
        ],
      )

    );
  }
}



