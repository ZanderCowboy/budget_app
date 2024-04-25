import 'package:budget_app/model/funds/funds.dart';
import 'package:budget_app/utils/constants.dart';
import 'package:budget_app/utils/db/sql_helper.dart';
import 'package:budget_app/view/drawer/drawer.dart';
import 'package:flutter/material.dart';

class FundsPage extends StatefulWidget {
  const FundsPage({super.key});

  @override
  State<FundsPage> createState() => _FundsPageState();
}

class _FundsPageState extends State<FundsPage> {
  List<Funds> fundsList = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _insertFunds(Funds f) async {
    await SQLHelper.createFunds(f);
    final funds = await SQLHelper.getAllFunds();
    setState(() {
      fundsList = funds;
    });
  }

  List<Widget> fundsListToWidgets() {
    return fundsList.map((f) => f.toFundsCard()).toList();
  }

  void _clear() {
    _nameController.clear();
    _descriptionController.clear();
  }

  Future<void> _showForm() async {
    await showModalBottomSheet<Funds>(
      isScrollControlled: true,
      isDismissible: false,
      elevation: 5,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 120,
        ),
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
              controller: _descriptionController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink),
                  ),
                  onPressed: () {
                    final name = _nameController.text;
                    final description = _descriptionController.text;
                    final fund = Funds(
                      id: 0,
                      name: name,
                      description: description,
                      total: 0,
                    );

                    _clear();
                    _insertFunds(fund);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepOrange),
                  ),
                  onPressed: () {
                    _clear();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _refresh() async {
    final funds = await SQLHelper.getAllFunds();
    setState(() {
      fundsList = funds;
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
      body: Center(
        child: ListView(
          children: fundsListToWidgets(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: _showForm,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
