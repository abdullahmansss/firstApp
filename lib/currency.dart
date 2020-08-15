import 'package:flutter/material.dart';

class Currency extends StatefulWidget
{
  Currency(this.f);

  String f;

  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency>
{
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Currency'
        ),
        backgroundColor: Colors.teal,
        leading: GestureDetector(
          onTap: ()
          {
            Navigator.pop(context);
          },
          child: Text(
            'Back'
          ),
        ),
        actions: <Widget>[
          Icon(
            Icons.monetization_on,
          ),
          Text(
            'hello'
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              widget.f,
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'name',
              ),
            ),
            FlatButton(
              onPressed: (){
                print(controller.text);
              },
              child: Text(
                'button'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
