import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riotgg/backend_api/champions/service/champions_service.dart';
import 'package:riotgg/features/main/pages/champion/view/champion_state.dart';

class ChampionController extends Cubit<ChampionState> {
  final ChampionsService championsService;

  ChampionController({
    required this.championsService,
  }) : super(ChampionState(status: ChampionStatus.initial));


  Future<void> getChampions() async {
    try {
      emit(state.copyWith(status: ChampionStatus.loading, champions: []));

      final listaChampions = await championsService.getChampions();
      for (var champion in listaChampions){
        debugPrint(champion.nome);
      }
      emit(state.copyWith(status: ChampionStatus.initial, champions: listaChampions));
    } catch (e) {
      emit(state.copyWith(
        status: ChampionStatus.error,
        errorMessage: 'Erro ao pegar lista de campeoes.',
      ));
    }
  }

}
