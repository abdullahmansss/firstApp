import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: FlatButton(
        onPressed: ()
        {
          FirebaseAuth.instance.signOut();
        },
        child: Text(
          'sign out'
        ),
      ),
    );
  }
}
