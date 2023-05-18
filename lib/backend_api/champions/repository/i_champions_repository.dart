import 'package:riotgg/shared/models/champion_model.dart';

abstract class IChampionsRepository {
  Future<ChampionModel> buscaAleatoriaChampion();
  Future<List<ChampionModel>> getChampions();
  
}