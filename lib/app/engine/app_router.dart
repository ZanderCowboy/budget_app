import 'package:auto_route/auto_route.dart';
import 'package:budget_app/app/engine/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomePageRoute.page, initial: true),
        AutoRoute(page: FundsPageRoute.page),
        AutoRoute(page: TransactionPageRoute.page),
        AutoRoute(page: TransfersPageRoute.page),
      ];
}
