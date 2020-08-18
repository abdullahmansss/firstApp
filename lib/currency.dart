import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Currency extends StatefulWidget
{
  String title;

  Currency({this.title});

  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency>
{
  var controller = TextEditingController();
  double result = 0.0;
  String hh;

  @override
  Widget build(BuildContext context)
  {
    hint(widget.title);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: hh,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      result.toString(),
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Container(
                width: double.infinity,
                height: 40.0,
                color: Colors.teal,
                child: MaterialButton(
                  onPressed: (){
                    operation(widget.title);
                  },
                  child: Text(
                    'Convert',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void operation(String from)
  {
    switch(from)
    {
      case 'Speed':
        String data = controller.text;

        if(data.isEmpty)
        {
          print('enter currency');
          return;
        }

        setState(() {
          result = double.parse(data) * 1000;
        });
        break;
      case 'Distance':
        String data = controller.text;

        if(data.isEmpty)
        {
          print('enter currency');
          return;
        }

        setState(() {
          result = double.parse(data) * 60;
        });
        break;
      case 'Time':
        String data = controller.text;

        if(data.isEmpty)
        {
          print('enter currency');
          return;
        }

        setState(() {
          result = double.parse(data) * 60;
        });
        break;
      case 'Currency':
        String data = controller.text;

        if(data.isEmpty)
        {
          print('enter currency');
          return;
        }

        setState(() {
          result = double.parse(data) * 16;
        });

        break;
    }
  }

  void hint(String from)
  {
    switch(from)
    {
      case 'Speed':
        setState(() {
          hh = 'Enter Speed in KM';
        });
        break;
      case 'Distance':
        setState(() {
          hh = 'Enter Distance';
        });
        break;
      case 'Time':
        setState(() {
          hh = 'Enter Time in Hour';
        });
        break;
      case 'Currency':
        setState(() {
          hh = 'Enter Currency in EGP';
        });
        break;
    }
  }
}