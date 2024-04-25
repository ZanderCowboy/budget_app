import 'package:budget_app/model/money/account_card.dart';
import 'package:budget_app/model/money/balance_card.dart';
import 'package:budget_app/utils/constants.dart';
import 'package:budget_app/utils/db/sql_helper.dart';
import 'package:budget_app/view/drawer/drawer.dart';
import 'package:flutter/material.dart';

class MoneyPage extends StatefulWidget {
  const MoneyPage({super.key});

  @override
  State<MoneyPage> createState() => _MoneyPageState();
}

class _MoneyPageState extends State<MoneyPage> {
  double _investmentAmount = 0;
  double _debtAmount = 0;
  double _totalAmount = 0;
  double _bankAmount = 0;

  Future<void> _refresh() async {
    // @todo get the amounts here
    final accountList = await SQLHelper.getAllAccounts();

    final invest = accountList
        .firstWhere((acc) => acc.name == SQLHelper.investment)
        .amount;

    final debt =
        accountList.firstWhere((acc) => acc.name == SQLHelper.debt).amount;

    final bank =
        accountList.firstWhere((acc) => acc.name == SQLHelper.bank).amount;

    final netWorth =
        accountList.fold<double>(0, (acc, elem) => acc + elem.amount);

    setState(() {
      _investmentAmount = invest;
      _debtAmount = debt;
      _bankAmount = bank;
      _totalAmount = netWorth;
    });
  }

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    final total = _bankAmount + _investmentAmount - _debtAmount;

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text(nameOfApp),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.refresh_sharp,
              color: Colors.white,
            ),
            onPressed: _refresh,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          AccountCard(
            investValue: _investmentAmount,
            debtValue: _debtAmount,
            totalValue: _totalAmount,
          ),
          BalanceCard(name: 'Net Worth', cash: total),
          BalanceCard(name: 'Bank Balance', cash: _bankAmount),
        ],
      ),
    );
  }
}
