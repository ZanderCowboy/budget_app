import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String date = DateTime.now().year.toString();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text('Powered by Hendré S Hayman © $date',
      ),
    );
  }
}