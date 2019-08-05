import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String _title;
  AppBarTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('VIVA ARANZAZU',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
                color: Color(0xffFF3454))),
        Text(' PH ',
            style: TextStyle(color: Color(0xffFF3454), fontSize: 12.0)),
        Text(_title,
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12.0,
                color: Colors.black)),
      ],
    );
  }
}
