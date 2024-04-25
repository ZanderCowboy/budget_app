import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now().year.toString();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text(
        'Powered by Hendré S Hayman © $date',
      ),
    );
  }
}
