import 'package:flutter/material.dart';
import 'package:projetopdm/api/fetchApiHero.dart';
import 'package:projetopdm/model/hero.dart';


class TelaHeroi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Herois"),),
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
      heroes = fetchedHeroes; // Aqui atualiza o estado do array inserindo os Herois nele
    });
  }
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: heroes.length,
        itemBuilder: (context, index) {
          return 
                Card(

                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10),),
                  color: Colors.white12,
                  margin: EdgeInsets.all(8),
                  child:
                      Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                      child:
                      Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(margin: EdgeInsetsGeometry.all(15),
                            child: Image(image: NetworkImage(heroes[index].imageUrl),width: 56,),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsetsGeometry.all(15),
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(heroes[index].name,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, )),
                                    Text("Durabilidade: "+heroes[index].intelligence.toString(),style: TextStyle(fontSize: 12), ),
                                    Text("Velocidade: "+heroes[index].speed.toString(),style: TextStyle(fontSize: 12),),

                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                              margin: EdgeInsetsGeometry.all(15) ,
                              child:
                              Column(
                                  children: [
                              Text(heroes[index].power.toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, )),
                              ElevatedButton(onPressed: ()=>{}, child: Text("Ver")),
                              ],)
                              )

                        ],
                      ),
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

