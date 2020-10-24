import 'package:first_flutter/b1.dart';
import 'package:first_flutter/b2.dart';
import 'package:first_flutter/database.dart';
import 'package:first_flutter/modules/chats/chats_screen.dart';
import 'package:first_flutter/modules/profile/profile.dart';
import 'package:first_flutter/modules/users/users_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget
{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  int currentIndex = 0;

  List<Widget> bottoms = [
    UsersScreen(),
    ChatsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: bottoms[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
            ),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          print('$index');
        },
        currentIndex: currentIndex,
      ),
    );
  }
}