// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:riotgg/backend_api/champions/service/champions_service.dart';
import 'package:riotgg/features/main/pages/random_champion/View/random_champion_state.dart';
import 'package:riotgg/shared/exceptions/database_exception.dart';

class RandomChampionController extends Cubit<RandomChampionState> {
  final ChampionsService championsService;

  RandomChampionController({
    required this.championsService,
  }) : super(RandomChampionState(status: RandomChampionStatus.initial));

  Future<void> buscaAleatoriaChampion() async {
    try {
      emit(state.copyWith(status: RandomChampionStatus.loading));

      var champion = await championsService.buscaAleatoriaChampion();
      String lane = getRandomLane([
        'Top',
        'Jg',
        'Mid',
        'Adc',
        'Sup',
      ]);

      emit(
        state.copyWith(
            status: RandomChampionStatus.success,
            successMessage: 'Campeão aleatorio encontrado!',
            championModel: champion,
            randomLane: lane),
      );
    } on DatabaseException catch (e) {
      emit(state.copyWith(
          status: RandomChampionStatus.error, errorMessage: e.message));
    }
  }

  String getRandomLane(List<String> list) {
    return list[Random().nextInt(list.length)];
  }
}
