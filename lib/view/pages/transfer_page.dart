import 'package:budget_app/model/funds/funds.dart';
import 'package:budget_app/model/money/account.dart';
import 'package:budget_app/model/money/money_man.dart';
import 'package:budget_app/utils/constants.dart';
import 'package:budget_app/utils/db/sql_helper.dart';
import 'package:budget_app/view/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class TransferPage extends StatefulWidget {
  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final TextEditingController _amountController = TextEditingController();

  List<DropdownMenuItem<int>> _transferList = [];

  Map<int, Account> _accountMap = {};
  Map<int, Funds> _fundsMap = {};

  final List<Color> _fundsColours = const [
    Color(0xFFFF9482),
    Color(0xFF7D77FF)
  ];

  final List<Color> _accountsColours = const [
    // Color(0xFF6EE2F5),
    // Color(0xFF6454F0),
    Colors.greenAccent,
    Color(0xFF64E8DE),
    Color(0xFF3499FF),
  ];

  Future<bool> _accounts() async {
    final List<Account> accounts = await SQLHelper.getAllAccounts();
    Map<int, Account> newMap = {};
    final newAccountsMap = accounts
        .asMap()
        .entries
        .map((acc) => newMap[acc.key] = acc.value)
        .toList()
        .asMap();
    final dropdownList = newAccountsMap.entries
        .map((acc) =>
            DropdownMenuItem(child: Text(acc.value.name), value: acc.key))
        .toList();
    setState(() {
      _accountMap.clear();
      _accountMap.addAll(newAccountsMap);
      _transferList = dropdownList;
    });
    return true;
  }

  Tuple2<List<DropdownMenuItem<int>>, List<DropdownMenuItem<int>>>
      _accountsDropdownList(int selectedValue) {
    final toList = _accountMap.entries
        .toList()
        .where((element) => element.key != selectedValue)
        .map((acc) =>
            DropdownMenuItem(child: Text(acc.value.name), value: acc.key))
        .toList();
    return Tuple2(_transferList, toList);
  }

  Future<bool> _funds() async {
    final List<Funds> funds = await SQLHelper.getAllFunds();
    Map<int, Funds> newMap = {};
    final newFundsMap = funds
        .asMap()
        .entries
        .map((fund) => newMap[fund.key] = fund.value)
        .toList()
        .asMap();
    final dropdownList = newFundsMap.entries
        .map((fund) =>
            DropdownMenuItem(child: Text(fund.value.name), value: fund.key))
        .toList();
    dropdownList.forEach((element) => print(element.value));
    setState(() {
      _fundsMap.clear();
      _fundsMap.addAll(newFundsMap);
      _transferList = dropdownList;
    });
    return true;
  }

  Tuple2<List<DropdownMenuItem<int>>, List<DropdownMenuItem<int>>>
      _fundsDropdownList(int selectedValue) {
    final toList = _fundsMap.entries
        .toList()
        .where((element) => element.key != selectedValue)
        .map((fund) =>
            DropdownMenuItem(child: Text(fund.value.name), value: fund.key))
        .toList();
    return Tuple2(_transferList, toList);
  }

  void _showForm(bool type) async {
    final _ = await (type ? _accounts() : _funds());

    int fromInt = 0;
    int toInt = 1;
    Tuple2<List<DropdownMenuItem<int>>, List<DropdownMenuItem<int>>>
        transferLists =
        type ? _accountsDropdownList(fromInt) : _fundsDropdownList(fromInt);

    showModalBottomSheet(
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
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const Text('From :',
                            style:
                                TextStyle(fontSize: 17, color: Colors.black54)),
                        const SizedBox(
                          width: 45,
                        ),
                        DropdownButton(
                            value: fromInt,
                            items: transferLists.item1,
                            onChanged: (int? value) {
                              setModalState(() {
                                transferLists = type
                                    ? _accountsDropdownList(value!)
                                    : _fundsDropdownList(value!);
                                fromInt = value;
                                toInt = transferLists.item2.first.value!;
                              });
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const Text('To :',
                            style:
                                TextStyle(fontSize: 17, color: Colors.black54)),
                        const SizedBox(
                          width: 45,
                        ),
                        DropdownButton(
                          value: toInt,
                          items: transferLists.item2,
                          onChanged: (int? value) {
                            setModalState(() {
                              toInt = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    TextField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          prefixText: 'R ',
                          labelText: 'Amount',
                        )),
                    const SizedBox(
                      width: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black87)),
                            onPressed: () {
                              final double amount =
                                  double.parse(_amountController.text);

                              if (type) {
                                final from = _accountMap[fromInt]!;
                                final to = _accountMap[toInt]!;
                                MoneyMan.transferAccount(from, to, amount);
                              } else {
                                final from = _fundsMap[fromInt]!;
                                final to = _fundsMap[toInt]!;
                                MoneyMan.transferFunds(from, to, amount);
                              }
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
                                  MaterialStateProperty.all(Colors.white70)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }));
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _accounts();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      // persistentFooterButtons: [AppFooter()],
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text(nameOfApp),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // _accountsDropdownList();
                _showForm(true);
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: _fundsColours),
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: 300,
                  height: 100,
                  alignment: Alignment.center,
                  child: const Text(
                    'Accounts',
                    style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // _accountsDropdownList();
                _showForm(false);
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: _accountsColours),
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: 300,
                  height: 100,
                  alignment: Alignment.center,
                  child: const Text(
                    'Funds',
                    style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
