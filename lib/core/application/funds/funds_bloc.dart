import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'funds_state.dart';
part 'funds_event.dart';
part 'funds_bloc.freezed.dart';

@Injectable()
class FundsBloc extends Bloc<FundsEvent, FundsState> {
  FundsBloc() : super(const FundsState.initial()) {
    on<FundsEvent>(
      (event, emit) {
        event.map(
          onGetFunds: (value) {},
          onFetchFunds: (value) {},
          onPressedEditFunds: (value) {},
          onPressedAddFund: (value) {},
          onChangedFundName: (value) {},
          onChangedFundDescription: (value) {},
          onPressedSubmit: (value) {},
          onPressedCancel: (value) {},
        );
      },
    );
  }
}
