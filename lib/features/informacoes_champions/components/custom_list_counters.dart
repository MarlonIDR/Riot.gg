import 'package:flutter/material.dart';
import 'package:riotgg/shared/models/champion_model.dart';

class CustomListCounters extends StatelessWidget {
  final ChampionModel champion;


  CustomListCounters({required this.champion});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      color: Colors.blue,
      
      // decoration: BoxDecoration(
      //   color: Colors.grey[200],
      //   borderRadius: BorderRadius.circular(32),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            champion.counterForte1Url,
            width: 50,
            height: 50,
          ),
          SizedBox(height: 8),
          Text(
            champion.counterForte1Nome,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
