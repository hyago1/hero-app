import 'dart:developer';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projetopdm/model/hero.dart';
import 'package:projetopdm/ui/pages/TelaHeroDetails.dart';
import 'package:projetopdm/ui/widgets/ListItemWidget.dart';

class TelaBattle extends StatefulWidget {
  const TelaBattle({super.key});

  @override
  State<TelaBattle> createState() => _TelaBattleState();
}

class _TelaBattleState extends State<TelaBattle> {
  int load = 0;
  List<HeroModel> heroes = [];
  List<HeroModel> herosAleatorio = [];

  @override
  void initState() {
    super.initState();
    _loadHeroes();
  }

  Future<void> _loadHeroes() async {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid ?? "userId";
    final userRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('cards');
    final snapshot = await userRef.get();

    heroes = snapshot.docs.map((e) => HeroModel.fromJson(e.data())).toList();
    herosAleatorio = List.from(heroes)..shuffle(Random());

    setState(() {}); // 🔹 atualiza a tela quando terminar de carregar
  }

  @override
  Widget build(BuildContext context) {
    if (herosAleatorio.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    if (load >= herosAleatorio.length) {
      return const Center(
        child: Text('Fim da batalha', style: TextStyle(color: Colors.white)),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: TelaHeroDetails(
                image: herosAleatorio[load].imageUrl,
                durability: herosAleatorio[load].durability.toString(),
                speed: herosAleatorio[load].speed.toString(),
                combat: herosAleatorio[load].combat.toString(),
                name: herosAleatorio[load].name.toString(),
                power: herosAleatorio[load].power.toString(),
                intelligence: herosAleatorio[load].intelligence.toString(),
                strength: herosAleatorio[load].strength.toString(),
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => load++),
                  child: const Text("Ganhei"),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => load++),
                  child: const Text("Empatei"),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => load++),
                  child: const Text("Perdi"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
