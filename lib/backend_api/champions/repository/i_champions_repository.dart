import 'package:riotgg/shared/models/champion_model.dart';

abstract class IChampionsRepository {
  Future<ChampionModel> buscaAleatoriaChampion();
  Future<List<ChampionModel>> getChampions();
  Future<List<ChampionModel>> getChampionsTop();
  Future<List<ChampionModel>> getChampionsJg();
  Future<List<ChampionModel>> getChampionsMid();
  Future<List<ChampionModel>> getChampionsAdc();
  Future<List<ChampionModel>> getChampionsSup();
  
}