import 'package:budget_app/utils/constants.dart';
import 'package:budget_app/view/pages/accounts_page.dart';
import 'package:budget_app/view/pages/funds_page.dart';
import 'package:budget_app/view/pages/transations_page.dart';
import 'package:budget_app/view/pages/transfer_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BudgetApp());

class BudgetApp extends StatelessWidget {
  const BudgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: nameOfApp,
      initialRoute: rootRoute,
      routes: {
        // rootRoute: (context) => PortfolioPage(),
        // salaryRoute: (context) => SalaryPage(),
        // fundsRoute: (context) => FundsPage(),
        rootRoute: (context) => const MoneyPage(),
        fundsRoute: (context) => const FundsPage(),
        transactionsRoute: (context) => const TransactionPage(),
        transferRoute: (context) => const TransferPage(),
      },
    );
  }
}
