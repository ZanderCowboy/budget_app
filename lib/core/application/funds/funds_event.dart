part of 'funds_bloc.dart';

@freezed
class FundsEvent with _$FundsEvent {
  const factory FundsEvent.onGetFunds() = OnGetFunds;
  const factory FundsEvent.onFetchFunds() = OnFetchFunds;
  const factory FundsEvent.onPressedEditFunds() = OnPressedEditFunds;
  const factory FundsEvent.onPressedAddFund() = OnPressedAddFund;
  const factory FundsEvent.onChangedFundName(String text) = OnChangedFundName;
  const factory FundsEvent.onChangedFundDescription(String text) =
      OnChangedFundDescription;
  const factory FundsEvent.onPressedSubmit() = OnPressedSubmit;
  const factory FundsEvent.onPressedCancel() = OnPressedCancel;
}
