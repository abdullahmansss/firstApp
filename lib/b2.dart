import 'package:flutter/material.dart';

class B2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'B2 Screen',
        style: TextStyle(
          fontSize: 30.0,
        ),
      ),
      bottomSheet: BottomSheet(
        onClosing: () {

        },
          builder: (ctx) => Text(
            'B2 Screen',
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
      ),
    );
  }
}