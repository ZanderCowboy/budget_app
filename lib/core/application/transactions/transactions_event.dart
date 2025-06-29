part of 'transactions_bloc.dart';

@freezed
class TransactionsEvent with _$TransactionsEvent {
  const factory TransactionsEvent.onGetTransactions() = OnGetTransactions;
  const factory TransactionsEvent.onFetchTransactions() = OnFetchTransactions;
  const factory TransactionsEvent.onPressedAddTransaction() =
      OnPressedAddTransaction;
  const factory TransactionsEvent.onChangedTransactionName(String text) =
      OnChangedTransactionName;
  const factory TransactionsEvent.onChangedTransactionAmount(double text) =
      OnChangedTransactionAmount;
  const factory TransactionsEvent.onChangedTransactionType(double text) =
      OnChangedTransactionType;
  const factory TransactionsEvent.onPressedSubmit() = OnPressedSubmit;
  const factory TransactionsEvent.onPressedCancel() = OnPressedCancel;
}
