import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget
{
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
{
  Map data;
  String id;
  File file;
  var userNameController = TextEditingController();

  @override
  void initState()
  {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: data != null ? SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: ()
                {
                  selectImage();
                },
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: file != null ? FileImage(file) : NetworkImage(data['image']),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                data['user_name']
              ),
              Text(
                  data['email']
              ),
              FlatButton(
                onPressed: ()
                {
                  FirebaseAuth.instance.signOut();
                },
                child: Text(
                  'sign out'
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              TextFormField(
                controller: userNameController,
              ),
              FlatButton(
                onPressed: ()
                {
                  updateInfo(userNameController.text);
                },
                child: Text(
                    'update'.toUpperCase()
                ),
              ),
              FlatButton(
                onPressed: ()
                {
                  uploadImage();
                },
                child: Text(
                    'upload image'.toUpperCase()
                ),
              ),
            ],
          ),
        ),
      ) : Center(child: CircularProgressIndicator()),
    );
  }

  getData() async
  {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    await SharedPreferences.getInstance().then((value)
    {
      id = value.getString('userID');

      users.doc(id).get().then((value)
      {
        data = value.data();

        setState(() {

        });
      }).catchError((e)
      {
        print('-------> error ${e.toString()}');
      });

      // users.doc(id).snapshots().listen((value)
      // {
      //   data = value.data();
      //   setState(()
      //   {
      //
      //   });
      // });
    });

    // users.doc('EMS0kiUFNLuwgaw3zH3L').get().then((value)
    // {
    //   data = value.data();
    //
    //   setState(() {
    //
    //   });
    // }).catchError((e)
    // {
    //   print('-------> error ${e.toString()}');
    // });
  }

  updateInfo(name)
  {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    users.doc(id).update({
      'user_name': name,
    }).then((value)
    {
      getData();
    }).catchError((error)
    {
      print(error.toString());
    });
  }

  selectImage() async
  {
    final f = await ImagePicker().getImage(source: ImageSource.gallery);
    file = File(f.path);

    setState(() {

    });
  }

  uploadImage() async
  {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('${file.uri.pathSegments[file.uri.pathSegments.length - 1]}')
        .putFile(file).onComplete.then((value) async
    {
      await value.ref.getDownloadURL().then((value)
      {
        CollectionReference users = FirebaseFirestore.instance.collection('users');

        users.doc(id).update({
          'image': value.toString(),
        }).then((value)
        {
          getData();
        }).catchError((error)
        {
          print(error.toString());
        });
      });
    });
  }
}