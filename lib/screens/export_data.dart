import 'package:flutter/material.dart';

class ExportData extends StatelessWidget {
  static const routeName = '/export';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autres'),
      ),
      body: Center(
        child: Text(
          'Pour bientôt',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
