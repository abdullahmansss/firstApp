import 'package:first_flutter/b1.dart';
import 'package:first_flutter/b2.dart';
import 'package:first_flutter/database.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> bottoms = [
    B1Screen(),
    B2Screen(),
    DataBase(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation'),
      ),
      body: bottoms[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
            ),
            title: Text('B 1'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
            ),
            title: Text('B 2'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
            ),
            title: Text('B 3'),
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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Icon(
                Icons.ac_unit,
              ),
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) => ListTile(
                selected: currentIndex == index ? true : false,
                onTap: ()
                {
                  setState(() {
                    currentIndex = index;
                  });
                  Navigator.of(context).pop();
                },
                title: Text(
                  'Item ${(index + 1).toString()}',
                ),
                leading: Icon(
                  Icons.home,
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                ),
              ),
              itemCount: 3,
            ),
          ],
        ),
      ),
    );
  }
}