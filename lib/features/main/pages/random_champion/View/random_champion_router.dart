import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riotgg/backend_api/champions/repository/champions_repository.dart';
import 'package:riotgg/backend_api/champions/service/champions_service.dart';
import 'package:riotgg/features/main/pages/random_champion/View/random_champion_page.dart';
import 'package:riotgg/features/main/pages/random_champion/controller/random_champion_controller.dart';

class RandomChampionRouter {
  static Widget get page => MultiProvider(
        providers: [
          Provider<ChampionsRepository>(
              create: (context) => ChampionsRepository()),
          Provider<ChampionsService>(
              create: (context) =>
                  ChampionsService(championsRepository: context.read())),
          Provider<RandomChampionController>(
              create: (context) =>
                  RandomChampionController(championsService: context.read()))
        ],
        child: const RandomChampionPage(),
      );
}
