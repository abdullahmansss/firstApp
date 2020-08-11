import 'package:flutter/material.dart';

class Counter extends StatefulWidget
{
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter>
{
  var result = 0;

  void change(int i)
  {
    switch(i)
    {
      case 2:
        result = result + 2;
        break;
      case 4:
        result = result + 4;
        break;
      case 6:
        result = result + 6;
        break;
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter App'
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    change(2);
                  });
                },
                child: Text(
                  '+2',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              FlatButton(
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    change(4);
                  });
                },
                child: Text(
                  '+4',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              FlatButton(
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    change(6);
                  });
                },
                child: Text(
                  '+6',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            result.toString(),
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}