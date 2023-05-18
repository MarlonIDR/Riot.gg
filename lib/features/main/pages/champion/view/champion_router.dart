import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riotgg/backend_api/champions/repository/champions_repository.dart';
import 'package:riotgg/backend_api/champions/service/champions_service.dart';
import 'package:riotgg/features/main/pages/champion/controller/champion_controller.dart';
import 'package:riotgg/features/main/pages/champion/view/champion_page.dart';

class ChampionRouter {
  static Widget get page => MultiProvider(
        providers: [
          Provider<ChampionsRepository>(
            create: (context) => ChampionsRepository(),
          ),
          Provider<ChampionsService>(
            create: (context) => ChampionsService(
              championsRepository: context.read(),
            ),
          ),
          Provider<ChampionController>(
            create: (context) => ChampionController(
              championsService: context.read(),
            ),
          ),
        ],
        child: const ChampionPage(),
      );
}
