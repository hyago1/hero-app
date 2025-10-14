import 'package:flutter/material.dart';
import 'package:projetopdm/api/fetchApiHero.dart';
import 'package:projetopdm/api/hero.dart';


class Batalhar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Batalhar"),),
      body:Center(
          child:
         HeroListScreen()
      ),
    );
  }
}


class ListHero extends  State<HeroListScreen> {
  List<HeroModel> heroes = [];
  @override
  void initState() {
    super.initState();
    _loadHeroes();
  }



  Future<void> _loadHeroes() async {

    List<HeroModel> fetchedHeroes = await fetch();
    setState(() {
      heroes = fetchedHeroes; // Atualizando o estado com os heróis carregados
    });
  }
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: heroes.length,
        itemBuilder: (context, index) {
          return 
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(3)),
                  color: Colors.red,
                  margin: EdgeInsets.all(5),
                  child:
                  Row(
                     children: [

                       Text("Nome"),
                       Text(heroes[index].name),


                     ],
                  )
                  ,
                );

        },
      );

  }
}


class HeroListScreen extends StatefulWidget {

  @override
  ListHero createState() => ListHero();
}

