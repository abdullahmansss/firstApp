import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserModel {
  final int id;
  final String name;

  // constructor
  UserModel({this.id, this.name});
}

class DataBase extends StatefulWidget {
  @override
  _DataBaseState createState() => _DataBaseState();
}

class _DataBaseState extends State<DataBase> {
  Database database;
  List<Map> list = [];
  var userNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    createDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database'),
      ),
      body: ListView.separated(
        itemCount: list.length,
        itemBuilder: (ctx, index) => buildItem(list, index, context),
        separatorBuilder: (ctx, index) => Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          newUser(context, null);
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  Widget buildItem(List<Map> list, int index, BuildContext context) =>
      GestureDetector(
        onLongPress: (){
          deleteDB(context , list[index]['id'], index);
        },
        onTap: () {
          newUser(context, list[index]);
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                child: Text(
                  list[index]['id'].toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                list[index]['name'].toString(),
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      );

  void newUser(BuildContext context, Map list) {
    if (list != null) userNameController..text = list['name'];

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        insetPadding: EdgeInsets.all(0.0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: userNameController,
              decoration: InputDecoration(hintText: 'enter user name'),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              width: double.infinity,
              height: 40.0,
              color: Colors.teal,
              child: FlatButton(
                onPressed: () {
                  String name = userNameController.text;

                  if (name.isNotEmpty) {
                    if (list != null)
                    {
                      updateDB(name, context, list['id']);
                    } else {
                      insertDB(name, context);
                    }
                  }
                },
                child: Text(
                  list != null ? 'Update User' : 'Add User',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void createDB() async {
    database = await openDatabase(
      'users.db',
      version: 1,
      onOpen: (db) {
        this.database = db;
        getDB();
      },
      onCreate: (Database db, int version) async {
        await db
            .execute('CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT)');
        print('---------------- > data base created');
      },
    );
  }

  void insertDB(String name, BuildContext context) async {
    await database.transaction((txn) async {
      int id = await txn.rawInsert('INSERT INTO Test(name) VALUES("$name")');

      print('---------------- > row inserted $id');
    }).then((value) {
      userNameController..text = '';
      getDB();
      Navigator.of(context).pop();
      return true;
    });
  }

  void getDB() async {
    list = await database.rawQuery('SELECT * FROM Test');
    setState(() {});

    print('---------------- > data base get ${list.length}');
    print('---------------- > data base get ${list.toString()}');
  }

  void updateDB(String name, BuildContext context, int id) async {
    int count = await database.rawUpdate(
        'UPDATE Test SET name = ? WHERE id = ${id.toString()}',
        ['$name']).then((value) {
      userNameController..text = '';
      getDB();
      Navigator.of(context).pop();
      return null;
    });

    print('---------------- > data base updated $count');
  }

  void deleteDB(BuildContext context, id, int index) async {
    int count = await database.rawDelete('DELETE FROM Test WHERE id = $id').then((value)
    {
      getDB();
      return null;
    });

    print('---------------- > data base deleted $count');
  }
}
