import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_flutter/modules/message/message_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget
{
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen>
{
  List usersList = [];

  @override
  void initState()
  {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: usersList.length != 0 ? ListView.separated(
          itemBuilder: (ctx, index) => buildUserItem(context, usersList[index]),
          separatorBuilder: (ctx, index) => Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
          itemCount: usersList.length,
      ) : Center(child: CircularProgressIndicator()),
    );
  }

  Widget buildUserItem (context, user) => InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => MessageScreen(
        user: user,
      )));
    },
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: user['image'].length != 0 ? NetworkImage(user['image']) : NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/User_font_awesome.svg/1200px-User_font_awesome.svg.png'),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user['user_name'],
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                    user['email']
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  getData() async
  {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    users.snapshots().listen((value)
    {
      usersList = value.docs;
      setState(()
      {

      });
    });
  }
}
