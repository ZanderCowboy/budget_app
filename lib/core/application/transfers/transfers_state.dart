part of 'transfers_bloc.dart';

@freezed
class TransfersState with _$TransfersState {
  const factory TransfersState.initial() = _Initial;
  const factory TransfersState.loadInProgress() = _LoadInProgress;
}
