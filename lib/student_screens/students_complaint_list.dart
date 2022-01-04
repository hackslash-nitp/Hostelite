import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:hostelite/student_screens/edit_profile_Student.dart';
import 'package:hostelite/student_screens/home_screen_Student.dart';
import 'package:hostelite/models/user_model.dart';
import 'package:hostelite/student_screens/studentexitrecords.dart';

class StudentComplaintList extends StatefulWidget {
  const StudentComplaintList({Key key}) : super(key: key);

  @override
  _StudentComplaintListState createState() => _StudentComplaintListState();
}

class _StudentComplaintListState extends State<StudentComplaintList> {
  List complaints = [];
  String userId = FirebaseAuth.instance.currentUser.uid;
  var db = FirebaseFirestore.instance;
  var compl = FirebaseFirestore.instance
      .collection('studentUsers')
      .doc(FirebaseAuth.instance.currentUser.uid)
      .collection('complaint');

  @override
  void initState() {
    super.initState();
    db
        .collection('studentUsers')
        .doc(userId)
        .collection('complaint')
        .get()
        .then((value) {
      setState(() {
        complaints = value.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Complaints'),
        backgroundColor: Color(0xffFE96FA),
      ),
      body: ListView.builder(
        itemCount: complaints.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffFDFDFD),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffC1C1C1),
                        blurRadius: 5.0, // soften the shadow
                        spreadRadius: 2.0, //extend the shadow
                        offset: Offset(
                          2.0, // Move to right 10  horizontally
                          2.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(
                          complaints[index]["issue"],
                          style: TextStyle(
                              color: Color(0xff565656),
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),
                      const Divider(
                        color: Color(0xffC1C1C1),
                        height: 25,
                        thickness: 2,
                        indent: 5,
                        endIndent: 5,
                      ),
                      Card(child: Image.network(complaints[index]["imageUrl"])),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(complaints[index]["roomNumber"]),
                            Text(complaints[index]["postedAt"]
                                .toDate()
                                .toString()
                                .substring(0, 11)),
                            Text(complaints[index]["postedAt"]
                                .toDate()
                                .toString()
                                .substring(11, 19))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 0),
                        child: Text(
                          complaints[index]["explanation"],
                          style:
                              TextStyle(color: Color(0xff5C5C5C), fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 0),
                        child: Text(
                          "Status: " + complaints[index]["status"],
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                )),
          );
        },
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
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomeScreenStudent()));
              },
              child: Icon(
                Icons.home_filled,
              ),
            ),
            Spacer(),
            //SizedBox(width: 10),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return StudentExitRecordList();
                  }),
                );
              },
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
                color: Color(0xffF989E7),
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
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class Cardcomplaint extends StatelessWidget {
  final complaints;
  final index;
  const Cardcomplaint({Key key, this.complaints, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffFDFDFD),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffC1C1C1),
                  blurRadius: 5.0, // soften the shadow
                  spreadRadius: 2.0, //extend the shadow
                  offset: Offset(
                    2.0, // Move to right 10  horizontally
                    2.0, // Move to bottom 10 Vertically
                  ),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text(
                    complaints[index]["title"],
                    style: TextStyle(
                        color: Color(0xff565656),
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
                const Divider(
                  color: Color(0xffC1C1C1),
                  height: 25,
                  thickness: 2,
                  indent: 5,
                  endIndent: 5,
                ),
                Card(child: Image.network('abc')),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: Text(
                    'abc',
                    style: TextStyle(color: Color(0xff5C5C5C), fontSize: 16),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('abc'), Text(DateTime.now().toString())],
                )
              ],
            ),
          )),
    );
  }
}
