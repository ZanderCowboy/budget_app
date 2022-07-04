import 'package:budget_app/model/money/money_man.dart';
import 'package:budget_app/model/transactions/cash_card.dart';
import 'package:budget_app/utils/constants.dart';
import 'package:budget_app/utils/db/sql_helper.dart';
import 'package:budget_app/view/drawer/drawer.dart';
import 'package:flutter/material.dart';

import 'package:budget_app/model/transactions/transactions.dart';

class TransactionPage extends StatefulWidget {
  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  static final List<DropdownMenuItem<int>> _menuItems = [
    const DropdownMenuItem(
        child: Text('Income',
            style: TextStyle(
                color: Color(0xFF099A41), fontWeight: FontWeight.bold)),
        value: 0),
    const DropdownMenuItem(
        child: Text('Expense',
            style: TextStyle(
                color: Color(0xFFC51B2C), fontWeight: FontWeight.bold)),
        value: 1),
  ];

  List<Transaction> _transList = [];
  double _cashBalance = 0;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();

  Future<void> _insertTrans(Transaction t) async {
    SQLHelper.createTransaction(t);
    final trans = await SQLHelper.getAllTransactions();
    final newCashBalance = await MoneyMan.newTransaction(t);
    setState(() {
      _transList = trans;
      _cashBalance = newCashBalance;
    });
  }

  List<Widget> _transListToWidgets() {
    return _transList
        .map((t) => t.toTransactionCard())
        .toList()
        .reversed
        .toList();
  }

  void _clear() {
    _nameController.clear();
    _amountController.clear();
    _typeController.clear();
  }

  void _showForm() async {
    int _value = 1;
    showModalBottomSheet<Transaction>(
        isScrollControlled: true,
        isDismissible: false,
        elevation: 5,
        context: context,
        builder: (context) => StatefulBuilder(
                builder: (BuildContext context, StateSetter setModalState) {
              return Container(
                color: Colors.white12,
                padding: EdgeInsets.only(
                    top: 15,
                    left: 15,
                    right: 15,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 120),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          prefixText: 'R ',
                          labelText: 'Amount',
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Text('Type',
                            style:
                                TextStyle(fontSize: 17, color: Colors.black54)),
                        const SizedBox(
                          width: 45,
                        ),
                        DropdownButton(
                            value: _value,
                            items: _menuItems,
                            onChanged: (int? value) {
                              setModalState(() {
                                _value = value!;
                              });
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.pink)),
                            onPressed: () {
                              final String name = _nameController.text;
                              final double amount =
                                  double.parse(_amountController.text);

                              final trans = Transaction(
                                  id: 0,
                                  name: name,
                                  amount: amount,
                                  type: _value,
                                  date: '');

                              _clear();
                              _insertTrans(trans);
                              Navigator.pop(context);
                            },
                            child: const Text('Submit',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))),
                        const SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.deepOrange)),
                          onPressed: () {
                            _clear();
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }));
  }

  void _refresh() async {
    final trans = await SQLHelper.getAllTransactions();
    final cashFund = await SQLHelper.readFunds(SQLHelper.cheque);
    setState(() {
      _transList = trans;
      _cashBalance = cashFund.total;
    });
  }

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      // persistentFooterButtons: [AppFooter()],
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text(nameOfApp),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.refresh_sharp,
                color: Colors.white,
              ),
              onPressed: () => _refresh(),
            )
          ]
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            CashCard(cash: _cashBalance),
            ..._transListToWidgets(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: () {
          _showForm();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
