import 'dart:ffi';

import 'package:flutter/material.dart';

class InBody extends StatefulWidget {
  @override
  _InBodyState createState() => _InBodyState();
}

class _InBodyState extends State<InBody>
{
  int rate = 100;
  int age = 20;
  int weight = 35;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'InBody App'
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey[300],
              ),
              child: Column(
                children: <Widget>[
                  Text(
                  'Height',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                  Slider(
                    value: rate.toDouble(),
                    min: 100.0,
                    max: 200.0,
                    inactiveColor: Colors.grey,
                    activeColor: Colors.red,
                    onChanged: (newValue)
                    {
                      setState(() {
                        rate = newValue.toInt();
                      });
                    },
                  ),
                  Text(
                    rate.toString(),
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.grey[300],
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Age',
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              onPressed: () {
                                if(age != 15)
                                {
                                  setState(() {
                                    age --;
                                  });
                                }
                              },
                              mini: true,
                              child: Icon(
                                Icons.remove,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              age.toString(),
                              style: TextStyle(
                                fontSize: 25.0,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age ++;
                                });
                              },
                              mini: true,
                              child: Icon(
                                Icons.add,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.grey[300],
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              onPressed: () {
                                if(weight != 30)
                                {
                                  setState(() {
                                    weight --;
                                  });
                                }
                              },
                              mini: true,
                              child: Icon(
                                Icons.remove,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                fontSize: 25.0,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight ++;
                                });
                              },
                              mini: true,
                              child: Icon(
                                Icons.add,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: double.infinity,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.teal,
              ),
              child: FlatButton(
                onPressed: () {  },
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}