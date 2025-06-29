import 'package:bloc/bloc.dart';
import 'package:budget_app/core/repositories/interfaces/account/i_account_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';
part 'home_event.dart';
part 'home_bloc.freezed.dart';

@Injectable()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.accountRepository) : super(HomeState.initial()) {
    on<HomeEvent>(
      (event, emit) async {
        event.map(
          onGetAccounts: (_) {},
          onFetchAccounts: (OnFetchAccounts value) {},
        );
      },
    );
  }

  final IAccountRepository accountRepository;
}
