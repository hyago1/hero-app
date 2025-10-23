import 'package:flutter/material.dart';
import 'package:projetopdm/ui/widgets/HeroDetailsWidgets/InfoHeroWidget.dart';

class TelaHeroDetails extends StatelessWidget {
  final String image;
  final String name;
  final String durability;
  final String speed;
  final String combat;
  final String power;
  final String intelligence;
  final String strength;




  const TelaHeroDetails({super.key, required this.image, required this.name, required this.durability, required this.speed, required this.combat, required this.power, required this.intelligence, required this.strength});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
      Container(
        padding: EdgeInsetsDirectional.only(top: 15, start: 20, end: 20),
        height: 600,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 1,color: Colors.white),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image),
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.5),
              BlendMode.dstATop,
            ),
          ),
         // color: const Color.fromARGB(255, 68, 42, 78),
          color: Colors.black,
        ),
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //texto
              width: (double.infinity),
              margin: EdgeInsetsDirectional.only(bottom: 10),
              padding: EdgeInsetsDirectional.only(
                start: 15,
                bottom: 4,
                top: 4,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withValues(alpha: 0.5),
              ),
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    child: Image(
                      image: NetworkImage(image),
                      height: 280,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    margin: EdgeInsetsDirectional.only(start: 10),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Card(
                            color: const Color.fromARGB(
                              255,
                              145,
                              161,
                              168,
                            ).withValues(alpha: 0.5),
                            child: Padding(
                              padding: EdgeInsetsGeometry.all(10),
                              child: Text(
                                "Humano",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ),
                          Card(
                            color: const Color.fromARGB(
                              255,
                              145,
                              161,
                              168,
                            ).withValues(alpha: 0.5),
                            child: Padding(
                              padding: EdgeInsetsGeometry.all(10),
                              child: Text(
                                "Terra",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  infoHeroWidget(info: "Power", value: power),
                  infoHeroWidget(info: "Durability", value: durability),
                  infoHeroWidget(info: "Speed", value: speed),
                  infoHeroWidget(info: "Combat", value: combat),
                  infoHeroWidget(info: "intelligence", value: intelligence),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
