import 'package:flutter/material.dart';

import 'package:projetopdm/api/fetchApiHero.dart';
import 'package:projetopdm/model/hero.dart';
import 'package:projetopdm/ui/widgets/ListItemWidget.dart';


class TelaHeros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Center(
          child:
         HeroListScreen()
      ),
    );
  }
}

class HeroListScreen extends StatefulWidget {
  @override
  ListHeros createState() => ListHeros();
}

class ListHeros extends  State<HeroListScreen> {
  List<HeroModel> heroes = [];
  int load = 0;
  List<Widget> setLoad = [];
  @override
  void initState() {
    super.initState();
    _loadHeroes();
  }

  Future<void> _loadHeroes() async {
    List<HeroModel> fetchedHeroes = await fetch();
    print(fetchedHeroes);
    setState(() {
      load = 1;
      heroes = fetchedHeroes; // Aqui atualiza o estado do array inserindo os Herois nele
    });
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
        SizedBox(height: 20),
      ],
    ),
      ListView.builder(
        itemCount: heroes.length,
        itemBuilder: (context, index) {
          return CardHero(image: heroes[index].imageUrl, durability: heroes[index].durability.toString(), speed: heroes[index].speed.toString(), combat: heroes[index].combat.toString(),name: heroes[index].name.toString(),power: heroes[index].power.toString(), intelligence:  heroes[index].intelligence.toString(), strength: heroes[index].strength.toString(),);
        },
      )][load];
  }
}




