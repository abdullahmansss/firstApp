import 'package:flutter/material.dart';

class Test extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Wrap(
        alignment: WrapAlignment.end,
        spacing: 10.0,
        runSpacing: 20.0,
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
          ),
          Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
          ),
          Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
          ),
          Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
          ),
          Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
          ),
          Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}