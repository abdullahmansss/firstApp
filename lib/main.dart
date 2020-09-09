import 'package:first_flutter/bloc/bloc.dart';
import 'package:first_flutter/database.dart';
import 'package:first_flutter/home.dart';
import 'package:first_flutter/in_body.dart';
import 'package:first_flutter/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: BlocProvider<T1Bloc>(
        create: (ctx) => T1Bloc(),
        child: HomeScreen(),
      ),
    );
  }
}