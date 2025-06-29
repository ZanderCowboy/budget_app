import 'package:auto_route/auto_route.dart';
import 'package:budget_app/core/application/home/home_bloc.dart';
import 'package:budget_app/get_it_injection.dart';
import 'package:budget_app/presentation/shared/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocProvider(
      create: (context) => coreSl<HomeBloc>(),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Budget App'),
          leading: IconButton(
            onPressed: () {
              coreSl<HomeBloc>().add(const HomeEvent.onGetAccounts());
              scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(Icons.abc),
          ),
        ),
        drawer: const AppDrawer(),
        body: const _View(),
      ),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Placeholder(
            fallbackHeight: 250,
          ),
          Placeholder(
            fallbackHeight: 100,
          ),
          Placeholder(
            fallbackHeight: 100,
          ),
        ],
      ),
    );
  }
}
