// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:riotgg/shared/models/champion_model.dart';

class InformacoesChampionsPage extends StatelessWidget {
  final ChampionModel championModel;

  const InformacoesChampionsPage({
    Key? key,
    required this.championModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/imagens/Aatrox_0.jpg',
                    height: screenSize.height * 0.3,
                    width: screenSize.width * 1,
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: Text(
                      championModel.nome,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(height: 16),
              Text(
                championModel.lane,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
