import 'package:budget_app/app/engine/app_router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Material App',
      routerConfig: _appRouter.config(),
    );
  }
}
