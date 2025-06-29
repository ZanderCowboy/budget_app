part of 'funds_bloc.dart';

@freezed
class FundsState with _$FundsState {
  const factory FundsState.initial() = _Initial;
  const factory FundsState.loadInProgress() = _LoadInProgress;
}
