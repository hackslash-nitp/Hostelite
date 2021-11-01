import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/home_screen_Student.dart';
import 'package:hostelite/students_complaint_list.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileStudent extends StatefulWidget {
  const EditProfileStudent({Key key}) : super(key: key);

  @override
  _EditProfileStudentState createState() => _EditProfileStudentState();
}

class _EditProfileStudentState extends State<EditProfileStudent> {

  File _pickedImage;

  var db = FirebaseFirestore.instance.collection('studentUsers').doc(FirebaseAuth.
  instance.currentUser.uid).collection('profile');

  final TextEditingController username = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController rollNumber = TextEditingController();
  final TextEditingController roomNumber = TextEditingController();
  Future buildUpdateProfile() async {
    await FirebaseFirestore.instance
        .collection("studentUsers")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("profile")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({
      "username": username.text,
      "mobileNumber": mobileNumber.text,
      "emailAddress": email.text,
      "roomNumber": roomNumber.text,
      "rollNumber": rollNumber.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 50, 15, 15),
            child: Column(children: [
              Row(children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                SizedBox(
                  width: 50,
                ),
                Text('Edit Profile',
                    style: TextStyle(fontSize: 24, color: Color(0xff747475))),
              ]),
              SizedBox(
                height: 35,
              ),
              GestureDetector(
                onTap: (){
                  ImagePicker().pickImage(source: ImageSource.gallery).then((value){
                    _pickedImage = File(value.path);
                    Reference reference = FirebaseStorage.instance.ref().child('images').child('dps').child(DateTime.now().microsecondsSinceEpoch.toString()+'.jpg');
                    UploadTask task = reference.putFile(_pickedImage);
                    task.whenComplete((){
                    reference.getDownloadURL().then((url){
                      db.get().then((value) {
                        debugPrint(value.docs[0].data().toString());
                        debugPrint(value.docs[0].data()["dpUrl"]+'ab');
                        value.docs[0].data()["dpUrl"].update({
                          "dpUrl":url
                        });
                      });

                    });
                    });
                  });
                },
                child: CircleAvatar(
                  radius: 85,
                  backgroundColor: Colors.orange[100],
                  // child: Image.network(db.doc()['dpUrl']),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              TextFormField(
                controller: username,
                decoration: InputDecoration(
                  hintText: 'username',
                  labelText: 'Name',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan, width: 1.0)),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  hintText: 'username',
                  labelText: 'Email',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan, width: 1.0)),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              TextFormField(
                controller: mobileNumber,
                decoration: InputDecoration(
                  hintText: 'username',
                  labelText: 'Mobile number',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan, width: 1.0)),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              TextFormField(
                controller: roomNumber,
                decoration: InputDecoration(
                  hintText: 'room no.',
                  labelText: 'Room number',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan, width: 1.0)),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              TextFormField(
                controller: rollNumber,
                decoration: InputDecoration(
                  hintText: 'roll no.',
                  labelText: 'Roll number',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan, width: 1.0)),
                ),
              ),
              SizedBox(height: 50),
              Container(
                width: 130,
                height: 50,
                child: MaterialButton(
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  color: Colors.purple,
                  minWidth: 100,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {
                    buildUpdateProfile();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomeScreenStudent()));
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey[300],
          ),
        ),
        height: 45,
        width: 380,
        child: Row(
          children: <Widget>[
            Spacer(),
            MaterialButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) {
                //         return HomeScreenAdmin( );
                //       }
                //   ),
                // );
              },
              child: Icon(
                Icons.home_filled,
              ),
            ),
            Spacer(),
            //SizedBox(width: 10),
            MaterialButton(
              onPressed: () {},
              child: Icon(
                Icons.add_chart_outlined,
              ),
            ),
            Spacer(),
            //SizedBox(width: 10),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return StudentComplaintList();
                  }),
                );
              },
              child: Icon(
                Icons.av_timer_outlined,
              ),
            ),
            Spacer(),
            //SizedBox(width: 10),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return EditProfileStudent();
                  }),
                );
              },
              icon: Icon(
                Icons.person,
                color: Color(0xffF989E7),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    ));
  }
}
