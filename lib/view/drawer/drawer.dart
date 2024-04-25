import 'package:budget_app/utils/constants.dart';
import 'package:budget_app/view/drawer/drawer_tile.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: secondaryColor,
      child: ListView(
        children: <Widget>[
          const SizedBox(height: 40),
          DrawerTile(
            title: drawerHome,
            icon: const Icon(Icons.account_balance_sharp, color: Colors.grey),
            press: () {
              Navigator.pushReplacementNamed(context, rootRoute);
            },
          ),
          DrawerTile(
            title: drawerFunds,
            icon: const Icon(
              Icons.account_balance_wallet_sharp,
              color: Colors.grey,
            ),
            press: () {
              Navigator.pushReplacementNamed(context, fundsRoute);
            },
          ),
          DrawerTile(
            title: drawerTransactions,
            icon: const Icon(Icons.attach_money_sharp, color: Colors.grey),
            press: () {
              Navigator.pushReplacementNamed(context, transactionsRoute);
            },
          ),
          DrawerTile(
            title: 'Transfers',
            icon: const Icon(Icons.swap_horiz_sharp, color: Colors.grey),
            press: () {
              Navigator.pushReplacementNamed(context, transferRoute);
            },
          ),
        ],
      ),
    );
  }
}
