import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'transactions_state.dart';
part 'transactions_event.dart';
part 'transactions_bloc.freezed.dart';

@Injectable()
class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc() : super(const TransactionsState.initial()) {
    on<TransactionsEvent>(
      (event, emit) {
        event.map(
          onGetTransactions: (OnGetTransactions value) {},
          onFetchTransactions: (OnFetchTransactions value) {},
          onPressedAddTransaction: (OnPressedAddTransaction value) {},
          onChangedTransactionName: (OnChangedTransactionName value) {},
          onChangedTransactionAmount: (OnChangedTransactionAmount value) {},
          onChangedTransactionType: (OnChangedTransactionType value) {},
          onPressedSubmit: (OnPressedSubmit value) {},
          onPressedCancel: (OnPressedCancel value) {},
        );
      },
    );
  }
}
