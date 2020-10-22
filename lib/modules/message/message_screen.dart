import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget
{
  final QueryDocumentSnapshot user;

  MessageScreen({this.user});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 15.0,
              backgroundImage: user['image'].length != 0 ? NetworkImage(user['image']) : NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/User_font_awesome.svg/1200px-User_font_awesome.svg.png'),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              user['user_name']
            ),
          ],
        ),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
