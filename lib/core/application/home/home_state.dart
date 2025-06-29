part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String? errorMessage,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
        errorMessage: '',
      );
}
