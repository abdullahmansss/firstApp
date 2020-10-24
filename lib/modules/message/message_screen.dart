import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessageScreen extends StatefulWidget
{
  final QueryDocumentSnapshot user;

  MessageScreen({this.user});

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
{
  var id;
  List messagesList = [];
  var messageController = TextEditingController();
  CollectionReference chats;

  @override
  void initState()
  {
    getMessages();
    super.initState();
  }

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
              backgroundImage: widget.user['image'].length != 0
                  ? NetworkImage(widget.user['image'])
                  : NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/User_font_awesome.svg/1200px-User_font_awesome.svg.png'),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(widget.user['user_name']),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (ctx, index) => buildMessage(context, messagesList[index]),
              separatorBuilder: (ctx, index) => SizedBox(
                height: 20.0,
              ),
              itemCount: messagesList.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: 'type your message..',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                FloatingActionButton(
                  onPressed: ()
                  {
                    sendMessage(messageController.text);
                  },
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  sendMessage(message)
  {
    chats = FirebaseFirestore.instance.collection('chats/$id/${widget.user['uId']}');
    CollectionReference chats2 = FirebaseFirestore.instance.collection('chats/${widget.user['uId']}/$id');

    chats.add({
      'message':message,
      'senderId':id,
    }).then((value)
    {
      chats.doc(value.id).update({
        'messageId':value.id,
      }).then((value)
      {
        chats2.add({
          'message':message,
          'senderId':id,
        }).then((value)
        {
          print('send successfully');
          messageController..text = '';
        }).catchError((e)
        {
          print(e.toString());
        });
      });

      print('send successfully');

    }).catchError((e)
    {
      print(e.toString());
    });
  }

  getMessages() async
  {
    await SharedPreferences.getInstance().then((value)
    {
      id = value.getString('userID');

      CollectionReference chats = FirebaseFirestore.instance.collection('chats/$id/${widget.user['uId']}');

      chats.snapshots().listen((event)
      {
        print(event.docs);
        messagesList = event.docs;

        setState(() {

        });
      });
    });
  }

  Widget buildMessage(context, msg) => Align(
        alignment: msg['senderId'] == id ? Alignment.centerRight : Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            width: 250.0,
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.teal,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${msg['message']}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '20:00',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
