import 'package:flutter/material.dart';

class Counter extends StatefulWidget
{
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter>
{
  int i = 0;
  TextEditingController textEditingController;

  @override
  Widget build(BuildContext context)
  {
    textEditingController = TextEditingController()..text = 'name';

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
              FloatingActionButton(
                onPressed: () {
                  setState(()
                  {
                    if(i != 0)
                    {
                      i--;
                    }
                  });
                },
                backgroundColor: Colors.teal,
                child: Icon(
                  Icons.remove,
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                '$i',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              FloatingActionButton(
                onPressed: ()
                {
                  if(i != 10)
                  {
                    setState(()
                    {
                      i++;
                    });
                  }
                },
                backgroundColor: Colors.teal,
                child: Icon(
                  Icons.add,
                ),
              ),
            ],
          ),
          TextField(
            controller: textEditingController,
          ),
        ],
      ),
    );
  }
}