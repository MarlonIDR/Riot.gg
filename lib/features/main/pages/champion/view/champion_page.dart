import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChampionPage extends StatefulWidget {
  const ChampionPage({super.key});

  @override
  State<ChampionPage> createState() => _ChampionPageState();
}

class _ChampionPageState extends State<ChampionPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('RIOT GG'),
      ),
      body: Center(
          child: Container(
            // height: 100,
            // width: 100,
        child: Image.asset(
          'assets/imagens/Zeri.png',
        ),
      )),
    );
  }
}
