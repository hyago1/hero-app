import 'package:flutter/material.dart';


class CardHero extends StatelessWidget {
  final String image;
  final String name;
  final String durability;
  final String speed;
  final String combat;
  final String power;


  const CardHero({super.key, required this.image, required this.durability, required this.speed, required this.combat, required this.power, required this.name});



  @override
  Widget build(BuildContext context) {
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
                child: Image(image: NetworkImage(image),width: 56,),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsetsGeometry.all(15),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, )),
                        Text("Durabilidade: "+durability,style: TextStyle(fontSize: 12), ),
                        Text("Velocidade: "+speed,style: TextStyle(fontSize: 12),),
                        Text("Combate: "+combat,style: TextStyle(fontSize: 12),),


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
                      Text(power,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, )),
                      ElevatedButton(onPressed: ()=>{}, child: Text("Ver")),
                    ],)
              )

            ],
          ),
        )

        ,
      );

  }
}
