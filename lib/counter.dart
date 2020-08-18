import 'package:first_flutter/currency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget
{
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Converter App'
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (ctx)
                          {
                            return Currency(
                              title: 'Currency',
                            );
                          },
                        ));
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Image(
                                  image: NetworkImage('https://zadcall.com/wp-content/uploads/2020/07/img_1_ar-2.png'),
                                ),
                                width: double.infinity,
                                color: Colors.red,
                              ),
                            ),
                            Container(
                              child: Text(
                                'Currency',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              width: double.infinity,
                              alignment: Alignment.center,
                              color: Colors.teal,
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (ctx)
                          {
                            return Currency(
                              title: 'Speed',
                            );
                          },
                        ));
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Image(
                                  image: NetworkImage('https://zadcall.com/wp-content/uploads/2020/07/img_1_ar-2.png'),
                                ),
                                width: double.infinity,
                                color: Colors.red,
                              ),
                            ),
                            Container(
                              child: Text(
                                'Speed',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              width: double.infinity,
                              alignment: Alignment.center,
                              color: Colors.teal,
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (ctx)
                          {
                            return Currency(
                              title: 'Time',
                            );
                          },
                        ));
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Image(
                                  image: NetworkImage('https://zadcall.com/wp-content/uploads/2020/07/img_1_ar-2.png'),
                                ),
                                width: double.infinity,
                                color: Colors.red,
                              ),
                            ),
                            Container(
                              child: Text(
                                'Time',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              width: double.infinity,
                              alignment: Alignment.center,
                              color: Colors.teal,
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (ctx)
                          {
                            return Currency(
                              title: 'Distance',
                            );
                          },
                        ));
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Image(
                                  image: NetworkImage('https://zadcall.com/wp-content/uploads/2020/07/img_1_ar-2.png'),
                                ),
                                width: double.infinity,
                                color: Colors.red,
                              ),
                            ),
                            Container(
                              child: Text(
                                'Distance',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              width: double.infinity,
                              alignment: Alignment.center,
                              color: Colors.teal,
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}