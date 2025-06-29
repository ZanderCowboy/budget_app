part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.onGetAccounts() = OnGetAccounts;
  const factory HomeEvent.onFetchAccounts() = OnFetchAccounts;
}
