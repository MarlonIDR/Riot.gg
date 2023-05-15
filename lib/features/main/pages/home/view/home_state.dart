// ignore_for_file: public_member_api_docs, sort_constructors_first
enum HomeStatus {
  initial,
  loading,
  success,
  error,
}

class HomeState {
  HomeStatus? status;
  String? initial;
  String? errorMessage;
  String? successMessage;
  HomeState({
    this.status,
    this.errorMessage,
    this.successMessage,
  });

  HomeState copyWith({
    HomeStatus? status,
    String? initial,
    String? errorMessage,
    String? successMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
    );
  }
}
