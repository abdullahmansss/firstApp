import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter/home.dart';
import 'package:first_flutter/modules/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget
{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
  var emailCon = TextEditingController();
  var passwordCon = TextEditingController();

  bool isShow = false;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailCon,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'enter email',
                  ),
                ),
                TextFormField(
                  controller: passwordCon,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'enter password',
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  height: 40.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.0),
                    color: Colors.teal,
                  ),
                  child: FlatButton(
                    onPressed: ()
                    {
                      setState(() {
                        isShow = true;
                      });
                      loginUser(emailCon.text, passwordCon.text, context);
                    },
                    child: Text(
                      'Login'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if(isShow)
            Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  void loginUser(email, password, context) async
  {
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) async
    {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userID', value.user.uid).then((value)
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    }).catchError((e)
    {
      setState(()
      {
        isShow = false;
      });

      switch(e.toString())
      {
        case '':
          Toast.show('el email mtsgl y m3lm', context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
          break;
        case '':
          Toast.show('el email mtsgl y m3lm', context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
          break;
      }

      print(e.toString());
    });
  }
}
