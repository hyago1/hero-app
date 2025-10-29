import 'package:flutter/material.dart';

class infoHeroWidget extends StatelessWidget {
  final String info;
  final String value;
  const infoHeroWidget({super.key, required this.info, required this.value});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      child: Container(
        margin: EdgeInsets.all(3),
        width: 280,
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(6),
        child: Padding(
          padding: EdgeInsetsGeometry.directional(start: 10, end: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                info,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 17,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
