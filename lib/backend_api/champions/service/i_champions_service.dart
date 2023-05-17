import 'package:riotgg/shared/models/champion_model.dart';

abstract class IChampionsService {
  Future<ChampionModel> buscaAleatoriaChampion();
}