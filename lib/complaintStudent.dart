import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/home_screen_Student.dart';
import 'package:image_picker/image_picker.dart';

class StudentComplaint extends StatefulWidget {
  const StudentComplaint({Key key}) : super(key: key);

  @override
  _StudentComplaintState createState() => _StudentComplaintState();
}

firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;
var imgcounter = 0;
firebase_storage.Reference ref =
    storage.ref().child('images/photo$imgcounter.png');

Dialog leadDialog = Dialog(
  child: Container(
    height: 300,
    width: 360,
    child: Column(
      children: <Widget>[
        Center(
          child: Image(
            image: AssetImage('assets/create_account_page/Vector.png'),
            height: 150,
            width: 150,
          ),
        ),
        Text(
          'Entry Marked',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Successfully',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        Container(
          width: 150.0,
          height: 40.0,
          child: MaterialButton(
            child: Text(
              'Done',
              style: TextStyle(color: Colors.white, fontSize: 17.0),
            ),
            color: Color(0xffFE96FA),
            minWidth: 100.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            onPressed: () {
              BuildContext context;
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomeScreenStudent();
              }));
            },
          ),
        ),
      ],
    ),
  ),
);

class _StudentComplaintState extends State<StudentComplaint> {
  var imageUrl = 'str';

  File img;
  getImage() async {
    ImagePicker _picker = ImagePicker();
    final XFile image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        img = File(image.path);
      });
    }
  }

  String roomNumber;
  String issue;
  String explanation;
  String status = "pending";
  int counter = 0;
  // Map<String, dynamic> allComplaints = {
  //   "issue": '',
  //   "roomNumber": '',
  //   "explanation": '',
  //   "userUid": FirebaseAuth.instance.currentUser.uid,
  //   "imageUrl": '',
  //   "status": "Pending"
  // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Complaints'),
        backgroundColor: Color(0xffFE96FA),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Room No.',
                      filled: true,
                      fillColor: Color(0xffF7F7F7),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.cyan, width: 1.0)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        roomNumber = value.trim();
                      });
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Your issue',
                      filled: true,
                      fillColor: Color(0xffF7F7F7),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.cyan, width: 1.0)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        issue = value.trim();
                      });
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Type an explanation',
                    filled: true,
                    fillColor: Color(0xffF7F7F7),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 1.0)),
                  ),
                  onChanged: (value) {
                    setState(() {
                      explanation = value.trim();
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      var image = getImage();
                      print(image);
                    },
                    child: Text(
                      'Upload Image',
                      style: TextStyle(fontSize: 16, color: Color(0xff1C48E7)),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Color(0xff1C48E7))),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: (img != null) ? Image.file(img) : Text(''),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    onPressed: () async {
                      firebase_storage.UploadTask uploadedImg =
                          ref.putFile(img);
                      await uploadedImg.whenComplete(() => null);

                      String url = "";

                      await ref.getDownloadURL().then((value) {
                        url = value;
                      });

                      // allComplaints = {
                      //   "issue": issue,
                      //   "roomNumber": roomNumber,
                      //   "explanation": explanation,
                      //   "userUid": FirebaseAuth.instance.currentUser.uid,
                      //   "imageUrl": url,
                      //   "status": status
                      // };

                      await FirebaseFirestore.instance
                          .collection("studentUsers")
                          .doc(FirebaseAuth.instance.currentUser.uid)
                          .collection("complaints")
                          .doc(FirebaseAuth.instance.currentUser.uid)
                          .collection('complaints$counter')
                          .doc(FirebaseAuth.instance.currentUser.uid)
                          .set({
                        "issue": issue,
                        "roomNumber": roomNumber,
                        "explanation": explanation,
                        "userUid": FirebaseAuth.instance.currentUser.uid,
                        "imageUrl": url,
                        "status": "Pending"
                      });

                      counter++;
                      imgcounter++;

                      // showDialog(
                      // context: context,
                      // ignore: non_constant_identifier_names
                      // builder: (BuildContext) => leadDialog
                      // );
                    },
                    color: Color(0xffFE96FA),
                    elevation: 10,
                    child: Text(
                      'Send',
                      style: TextStyle(fontSize: 16, color: Color(0xff33004A)),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Color(0xff1C48E7))),
                  ),
                  Container(
                    child: Text(imageUrl),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
