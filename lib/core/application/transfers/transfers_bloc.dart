import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'transfers_state.dart';
part 'transfers_event.dart';
part 'transfers_bloc.freezed.dart';

@Injectable()
class TransfersBloc extends Bloc<TransfersEvent, TransfersState> {
  TransfersBloc() : super(const TransfersState.initial()) {
    on<TransfersEvent>(
      (event, emit) {
        event.map(
          onGetTransfers: (OnGetTransfers value) {},
          onPressedAccounts: (OnPressedAccounts value) {},
          onPressedFunds: (OnPressedFunds value) {},
          onChangedFrom: (OnChangedFrom value) {},
          onChangedTo: (OnChangedTo value) {},
          onChangedAmount: (OnChangedAmount value) {},
          onPressedSubmit: (value) {},
          onPressedCancel: (value) {},
        );
      },
    );
  }
}
