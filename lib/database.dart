import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBase extends StatefulWidget
{
  @override
  _DataBaseState createState() => _DataBaseState();
}

class _DataBaseState extends State<DataBase>
{
  Database database;

  @override
  void initState()
  {
    super.initState();
    createDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Database'
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                insertDB();
              },
              child: Icon(
                Icons.add,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            FloatingActionButton(
              onPressed: () {
                getDB();
              },
              child: Icon(
                Icons.list,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            FloatingActionButton(
              onPressed: () {
                updateDB();
              },
              child: Icon(
                Icons.check,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            FloatingActionButton(
              onPressed: () {
                deleteDB();
              },
              child: Icon(
                Icons.remove,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void createDB() async
  {
    database = await openDatabase(
        'users.db',
        version: 1,
        onCreate: (Database db, int version) async
        {
          await db.execute(
              'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT)');
          print('---------------- > data base created');
        });
  }

  void insertDB() async {
    await database.transaction((txn) async
    {
      int id = await txn.rawInsert('INSERT INTO Test(name) VALUES("Ahmed")');
      print('---------------- > row inserted $id');
    });
  }

  void getDB() async {
    List<Map> list = await database.rawQuery('SELECT * FROM Test');

    print('---------------- > data base get ${list.length}');
    print('---------------- > data base get ${list.toString()}');
  }

  void updateDB() async {
    int count = await database.rawUpdate(
        'UPDATE Test SET name = ? WHERE id = 4',
        ['Osama']);

    print('---------------- > data base updated $count');
  }

  void deleteDB() async {
    int count = await database
        .rawDelete('DELETE FROM Test WHERE id = 3');

    print('---------------- > data base deleted $count');
  }
}
