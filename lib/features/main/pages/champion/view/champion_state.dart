// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:riotgg/shared/models/champion_model.dart';

enum ChampionStatus {
  initial,
  loading,
  loaded,
  success,
  error,
}

class ChampionState {
  ChampionStatus? status;
  String? initial;
  List<ChampionModel>? champions;
  String? errorMessage;
  String? successMessage;
  ChampionState({
    this.status,
    this.initial,
    this.champions,
    this.errorMessage,
    this.successMessage,
  });

  ChampionState copyWith({
    ChampionStatus? status,
    String? initial,
    List<ChampionModel>? champions,
    String? errorMessage,
    String? successMessage,
  }) {
    return ChampionState(
      status: status ?? this.status,
      initial: initial ?? this.initial,
      champions: champions,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
    );
  }
}
