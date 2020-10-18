import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List'
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  'start'
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Container(
                    height: 80.0,
                    child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) => buildItem2(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                    'end'
                ),
                SizedBox(
                  width: 20.0,
                ),
              ],
            ),
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) => buildItem('https://avatars1.githubusercontent.com/u/34492145?s=460&u=3874317b78e6f8269ed80b9f2f7342942c5121ee&v=4'),
            ),
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) => buildItem('https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__340.jpg'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(String s) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          radius: 40.0,
          backgroundImage: NetworkImage(
            s == null ? 'aaa' : s,
          ),
        ),
        SizedBox(
          width: 15.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  'Name'
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                  'Mobile'
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget buildItem2() => Padding(
    padding: const EdgeInsets.all(20.0),
    child: CircleAvatar(
      radius: 20.0,
      backgroundImage: NetworkImage('https://avatars1.githubusercontent.com/u/34492145?s=460&u=3874317b78e6f8269ed80b9f2f7342942c5121ee&v=4'),
    ),
  );
}
