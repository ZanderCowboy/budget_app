import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  /// Constructor for a drawer tile:
  ///
  ///  title = name of the tile
  ///
  ///  icon  = leading icon of tile
  ///
  ///  press = function for onTap
  ///
  const DrawerTile(
      {required this.title, required this.icon, required this.press});

  // VARIABLES
  final String title;
  final Icon icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: icon,
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
// final VoidCallback press;

}
