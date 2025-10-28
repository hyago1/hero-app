import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:projetopdm/model/hero.dart';

import 'package:projetopdm/ui/widgets/ListItemWidget.dart';

class TelaMyCards extends StatefulWidget {
  const TelaMyCards({super.key});

  @override
  State<TelaMyCards> createState() => _TelaMyCardsState();
}

class _TelaMyCardsState extends State<TelaMyCards> {
  int load = 0;
  List<HeroModel> heroes = [];
  void initState() {
    super.initState();
    _loadHeroes();
  }

  Future<void> _loadHeroes() async {
    final user = FirebaseAuth.instance.currentUser; // se tiver autenticação
    final userId = user?.uid ?? "userId"; // use um ID fixo se não tiver login
    final userRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('cards');
    print("user = $userId");
    final snapshot = await userRef.get();
    final data = snapshot;

    for (var element in data.docs) {
      print(element.data());
      heroes.add(HeroModel.fromJson(element.data()));
    }
    // if (snapshot) {
    //   Map<String, dynamic>? data = snapshot
    //       .data(); // Retorna um Map<String, dynamic>?
    //   if (data != null) {
    //     print("Dados do documento: $data");
    //   }
    // } else {
    //   print("Nenhum documento encontrado com o ID .");
    // }

    setState(() {
      load = 1;
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
          return ListItemWidget(
            image: heroes[index].imageUrl,
            durability: heroes[index].durability.toString(),
            speed: heroes[index].speed.toString(),
            combat: heroes[index].combat.toString(),
            name: heroes[index].name.toString(),
            power: heroes[index].power.toString(),
            intelligence: heroes[index].intelligence.toString(),
            strength: heroes[index].strength.toString(),
          );
        },
      ),
    ][load];
    ;
  }
}
