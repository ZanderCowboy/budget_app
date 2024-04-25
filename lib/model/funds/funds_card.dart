import 'package:budget_app/model/funds/funds.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

// https://www.freecodecamp.org/news/how-to-build-a-cryptocurrency-price-list-app-using-flutter-sdk-1c75998e1a58
class FundsCard extends StatelessWidget {
  const FundsCard({
    required this.funds,
    super.key,
  });

  static final RandomColor _randomColor = RandomColor();

  final Funds funds;

  Column _subTitle() {
    // final moneyColour =  (amount >= 0) ? Colors.green : Colors.red;
    // final moneyColour = (amount >= 0) ? _incomeColor : _expenseColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'R ${funds.total.toStringAsFixed(2)}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Text(
          funds.description,
          style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
          backgroundColor: _randomColor.randomColor(),
          child: Text(
            funds.name[0],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          //child: Icon(leadingIcon, color: Colors.white),
        ),
        title: Text(
          funds.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: _subTitle(),
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
