// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:riotgg/shared/models/champion_model.dart';

enum RandomChampionStatus {
  initial,
  loading,
  success,
  error,
}

class RandomChampionState {
  RandomChampionStatus? status;
  String? initial;
  String? errorMessage;
  String? successMessage;
  ChampionModel? championModel;
  String? randomLane;
  RandomChampionState({
    this.status,
    this.initial,
    this.errorMessage,
    this.successMessage,
    this.championModel,
    this.randomLane,
  });

  RandomChampionState copyWith({
    RandomChampionStatus? status,
    String? initial,
    String? errorMessage,
    String? successMessage,
    ChampionModel? championModel,
    String? randomLane,
  }) {
    return RandomChampionState(
      status: status ?? this.status,
      initial: initial ?? this.initial,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
      championModel: championModel ?? this.championModel,
      randomLane: randomLane ?? this.randomLane,
    );
  }
}
