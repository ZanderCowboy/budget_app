part of 'transfers_bloc.dart';

@freezed
class TransfersEvent with _$TransfersEvent {
  const factory TransfersEvent.onGetTransfers() = OnGetTransfers;
  const factory TransfersEvent.onPressedAccounts() = OnPressedAccounts;
  const factory TransfersEvent.onPressedFunds() = OnPressedFunds;
  const factory TransfersEvent.onChangedFrom(String text) = OnChangedFrom;
  const factory TransfersEvent.onChangedTo(String text) = OnChangedTo;
  const factory TransfersEvent.onChangedAmount(double value) = OnChangedAmount;
  const factory TransfersEvent.onPressedSubmit() = OnPressedSubmit;
  const factory TransfersEvent.onPressedCancel() = OnPressedCancel;
}
