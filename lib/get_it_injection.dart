import 'package:budget_app/get_it_injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final coreSl = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
GetIt configureCoreDependencies() {
  return coreSl.init();
}
