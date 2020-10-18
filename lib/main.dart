import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_flutter/modules/home/home.dart';
import 'package:first_flutter/modules/register/register.dart';
import 'package:flutter/material.dart';

bool isUser = false;

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if(FirebaseAuth.instance.currentUser != null)
    isUser = true;

  runApp(MyApp(isUser));
}

class MyApp extends StatelessWidget
{
  final bool isUser;

  MyApp(this.isUser);

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: isUser ? HomeScreen() : RegisterScreen(),
    );
  }
}