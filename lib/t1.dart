import 'package:flutter/material.dart';

class T1Screen extends StatefulWidget
{
  @override
  _T1ScreenState createState() => _T1ScreenState();
}

class _T1ScreenState extends State<T1Screen> {
  @override
  Widget build(BuildContext context)
  {
    int i = 2;

    return Column(
      children: <Widget>[
        Text(
          i.toString(),
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        FlatButton(
          onPressed: (){
            i++;
            print('$i');

            setState(()
            {

            });
          },
          child: Text('add'),
        ),
        GestureDetector(
          onTap: (){},
          child: Text(
            'add',
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
        ),
      ],
    );
  }
}