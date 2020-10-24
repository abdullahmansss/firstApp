import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Test extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: FlatButton(
        onPressed: () async
        {
          // url
          if(await canLaunch('google.com'))
            await launch('google.com');
          // phone
          if(await canLaunch('tel:+201115342559'))
            await launch('tel:+201115342559');
          // any app
          if(await canLaunch('...'))
            await launch('...');
        },
        child: null,
      ),
    );
  }
}