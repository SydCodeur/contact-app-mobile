import 'package:flutter/material.dart';

class MySpinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 3.5,
        valueColor: new AlwaysStoppedAnimation<Color>(
          // Theme.of(context).primaryColor,
          // Color(0xff48AB5A),
          Color(0xffEC6608),
        ),
      ),
    );
  }
}
