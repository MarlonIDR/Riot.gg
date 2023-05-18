import 'package:riotgg/backend_api/champions/repository/champions_repository.dart';
import 'package:riotgg/backend_api/champions/service/i_champions_service.dart';
import 'package:riotgg/shared/models/champion_model.dart';

class ChampionsService implements IChampionsService {
  final ChampionsRepository championsRepository;

  ChampionsService({
    required this.championsRepository,
  });

  @override
  Future<ChampionModel> buscaAleatoriaChampion() =>
      championsRepository.buscaAleatoriaChampion();

  @override
  Future<List<ChampionModel>> getChampions() =>
      championsRepository.getChampions();

  @override
  Future<List<ChampionModel>> getChampionsAdc() =>
      championsRepository.getChampionsAdc();

  @override
  Future<List<ChampionModel>> getChampionsJg() =>
      championsRepository.getChampionsJg();

  @override
  Future<List<ChampionModel>> getChampionsMid() =>
      championsRepository.getChampionsMid();

  @override
  Future<List<ChampionModel>> getChampionsSup() =>
      championsRepository.getChampionsSup();

  @override
  Future<List<ChampionModel>> getChampionsTop() =>
      championsRepository.getChampionsTop();
}
