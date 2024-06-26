import 'package:flutter/material.dart';

// https://www.freecodecamp.org/news/how-to-build-a-cryptocurrency-price-list-app-using-flutter-sdk-1c75998e1a58
class TransactionCard extends StatelessWidget {
  const TransactionCard({
    required this.id,
    required this.name,
    required this.amount,
    required this.date,
    this.incomeColor = const Color(0xFF099A41),
    this.expenseColor = const Color(0xFFC51B2C),
    super.key,
  });

  final int id;
  final String name;
  final double amount;
  final String date;
  final Color? incomeColor;
  final Color? expenseColor;

  // Text _subTitle() {
  //   String str = 'R ' + amount.toStringAsFixed(2) + '\n' + date.toString();
  //   return Text(str, style: const TextStyle(fontSize: 15));
  // }

  Column _subTitle(Color? c) {
    // final moneyColour =  (amount >= 0) ? Colors.green : Colors.red;
    // final moneyColour = (amount == 0) ? _incomeColor : _expenseColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'R ${amount.abs().toStringAsFixed(2)}',
          style: TextStyle(color: c, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Text(
          date,
          style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final leadingIcon = (amount >= 0) ? Icons.add_sharp : Icons.remove_sharp;
    final moneyColour = (amount >= 0) ? incomeColor : expenseColor;

    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10,
      color: Colors.white,
      shadowColor: Colors.black,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: moneyColour,
          child: Icon(leadingIcon, color: Colors.white),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: _subTitle(moneyColour),
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () => {},
        ),
        //_trail(),
        isThreeLine: true,
      ),
    );
  }

  // Widget _trail() {
  //   return SizedBox(
  //     width: 100,
  //     child: Row(
  //       children: [
  //         IconButton(
  //           icon: const Icon(Icons.edit),
  //           onPressed: () => print('Edit pressed'),
  //         ),
  //         IconButton(
  //           icon: const Icon(Icons.delete),
  //           // onPressed: () => _deleteItem(_transactions[index].id),
  //           onPressed: () => print('Delete pressed'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
