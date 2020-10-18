import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter/modules/home/home.dart';
import 'package:first_flutter/modules/login/login.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class RegisterScreen extends StatefulWidget
{
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
{
  var emailCon = TextEditingController();
  var usernameCon = TextEditingController();
  var passwordCon = TextEditingController();

  bool isShow = false;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
        ),
      ),
      body: Stack(
        children: [
          // Opacity(
          //   opacity: .5,
          //   child: Image(
          //     image: AssetImage('assets/images/back.png'),
          //     fit: BoxFit.cover,
          //     height: double.infinity,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: usernameCon,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'enter username',
                  ),
                ),
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
                        createUser(usernameCon.text, emailCon.text, passwordCon.text, context);
                      },
                      child: Text(
                        'Register'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    'already have an account?'
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

  void createUser(username, email, password, context)
  {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value)
    {
      addUser(username, email, value.user.uid);
    }).catchError((e)
    {
      setState(()
      {
        isShow = false;
      });

      switch(e.toString())
      {
        case '[firebase_auth/email-already-in-use] The email address is already in use by another account.':
          Toast.show('el email mtsgl y m3lm', context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
          break;
        case '':
          Toast.show('el email mtsgl y m3lm', context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
          break;
      }

      print(e.toString());
    });
  }

  void addUser(username, email, uId)
  {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    users.doc(email).set({
      'user_name':username,
      'email':email,
    }).then((value)
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }).catchError((e)
    {
      setState(()
      {
        isShow = false;
      });

      print(e.toString());
    });
  }
}