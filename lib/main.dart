import 'package:budget_app/view/pages/funds_page.dart';
import 'package:budget_app/view/pages/accounts_page.dart';
import 'package:budget_app/view/pages/transations_page.dart';
import 'package:budget_app/view/pages/transfer_page.dart';
import 'package:flutter/material.dart';

import 'utils/constants.dart';

void main() => runApp(BudgetApp());

class BudgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: nameOfApp,
      // theme: ThemeData.dark().copyWith(
      //   // primaryColor: primaryColour,
      //   // canvasColor: secondaryColour,
      //   // backgroundColor: backgroundColour,
      //   // scaffoldBackgroundColor: backgroundColour,
      //   scaffoldBackgroundColor: backgroundColor,
      //   canvasColor: secondaryColor,
      // ),
      // theme: ThemeData.dark().copyWith(
      //     scaffoldBackgroundColor: Colors.white
      // ),
      // theme: ThemeData().copyWith(
      //   canvasColor: secondaryColor,
      // ),
      initialRoute: rootRoute,
      routes: {
        // rootRoute: (context) => PortfolioPage(),
        // salaryRoute: (context) => SalaryPage(),
        // fundsRoute: (context) => FundsPage(),
        rootRoute: (context) => MoneyPage(),
        fundsRoute: (context) => FundsPage(),
        transactionsRoute: (context) => TransactionPage(),
        transferRoute: (context) => TransferPage(),
      },
    );
  }
}
