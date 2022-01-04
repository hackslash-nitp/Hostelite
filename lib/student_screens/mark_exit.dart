import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:hostelite/admin_screens/home_screen_Admin.dart';
import 'package:hostelite/student_screens/home_screen_Student.dart';
import 'package:hostelite/models/user_model.dart';
import 'package:hostelite/shared_files/decoration.dart';

class MarkingExit extends StatefulWidget {
  const MarkingExit({Key key}) : super(key: key);

  @override
  _MarkingExitState createState() => _MarkingExitState();
}

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
            color: Colors.pinkAccent[100],
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

class _MarkingExitState extends State<MarkingExit> {
  String roomNumber;
  String rollNumber;
  String purpose;
  String hostelName;

  var exitdb = FirebaseFirestore.instance
      .collection("studentUsers")
      .doc(FirebaseAuth.instance.currentUser.uid)
      .collection("exit");

  int exitdbsize;
  int entrydbsize;

  var entrydb = FirebaseFirestore.instance
      .collection("studentUsers")
      .doc(FirebaseAuth.instance.currentUser.uid)
      .collection("entry");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Mark Exit',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 10,
        backgroundColor: Color(0xffFE96FA),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/second_page/Group 33694.png'),
                  fit: BoxFit.contain)),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Roll No.',
                        filled: true,
                        fillColor: Color(0xffFFFFFF),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.cyan, width: 1.0)),
                      ),
                      onChanged: (value) {
                        setState(() {
                          rollNumber = value.trim();
                        });
                      }),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Room No.',
                        filled: true,
                        fillColor: Color(0xffFFFFFF),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
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
                  height: 30,
                ),
                Container(
                  child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Hostel Name',
                        filled: true,
                        fillColor: Color(0xffFFFFFF),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.cyan, width: 1.0)),
                      ),
                      onChanged: (value) {
                        setState(() {
                          hostelName = value.trim();
                        });
                      }),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Purpose of Exit',
                        filled: true,
                        fillColor: Color(0xffFFFFFF),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.cyan, width: 1.0)),
                      ),
                      onChanged: (value) {
                        setState(() {
                          purpose = value.trim();
                        });
                      }),
                ),
                SizedBox(height: 80),
                Container(
                  width: 130,
                  height: 50,
                  child: MaterialButton(
                    child: Text(
                      'Mark Exit',
                      style: TextStyle(color: Color(0xff33004A), fontSize: 15),
                    ),
                    color: Color(0xffFE96FA),
                    minWidth: 100,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () async {
                      if (roomNumber.isEmpty ||
                          rollNumber.isEmpty ||
                          hostelName.isEmpty ||
                          purpose.isEmpty) {
                        return SnackBar(
                            content: Text("Please enter all fields"));
                      }
                      exitdb.get().then(
                          (snapshots) => {exitdbsize = snapshots.docs.length});
                      entrydb.get().then(
                          (snapshots) => {entrydbsize = snapshots.docs.length});

                      if (exitdbsize == entrydbsize) {
                        int token = DateTime.now().microsecondsSinceEpoch;
                        exitdb.add({
                          "hostelName": hostelName,
                          "rollNumber": rollNumber,
                          "roomNumber": roomNumber,
                          "purpose": purpose,
                          "userUid": FirebaseAuth.instance.currentUser.uid,
                          "exitTime": DateTime.now().toLocal(),
                          "name": FirebaseAuth.instance.currentUser.displayName,
                          "entryTime": null,
                          "token": token
                        });
                        FirebaseFirestore.instance.collection('Exits').add({
                          "hostelName": hostelName,
                          "rollNumber": rollNumber,
                          "roomNumber": roomNumber,
                          "purpose": purpose,
                          "userUid": FirebaseAuth.instance.currentUser.uid,
                          "exitTime": DateTime.now().toLocal(),
                          "name": FirebaseAuth.instance.currentUser.displayName,
                          "entryTime": null,
                          "token": token
                        });
                        showDialog(
                            context: context,
                            // ignore: non_constant_identifier_names
                            builder: (BuildContext) => leadDialog);
                        return "";
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
