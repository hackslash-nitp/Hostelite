import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/student_screens/edit_profile_Student.dart';
import 'package:hostelite/student_screens/home_screen_Student.dart';
import 'package:hostelite/student_screens/students_complaint_list.dart';

class StudentExitRecordList extends StatefulWidget {
  const StudentExitRecordList({Key key}) : super(key: key);

  @override
  _StudentEntryRecordListState createState() => _StudentEntryRecordListState();
}

class _StudentEntryRecordListState extends State<StudentExitRecordList> {
  List my_exits = [];
  String userId = FirebaseAuth.instance.currentUser.uid;
  var db = FirebaseFirestore.instance;
  var entry = FirebaseFirestore.instance
      .collection('studentUsers')
      .doc(FirebaseAuth.instance.currentUser.uid)
      .collection('exit')
      .orderBy("time", descending: true);

  @override
  void initState() {
    super.initState();
    db
        .collection('studentUsers')
        .doc(userId)
        .collection('exit')
        .get()
        .then((value) {
      setState(() {
        my_exits = value.docs;
      });
      my_exits.sort((b, a) => a["time"].compareTo(b["time"]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Exit/Entry Records'),
        backgroundColor: Color(0xffFE96FA),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Card(
            //       child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Row(
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.only(left: 50.0),
            //           child: GestureDetector(
            //             onTap: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(builder: (context) {
            //                   return StudentEntryRecordList();
            //                 }),
            //               );
            //             },
            //             child: Container(
            //               child: Text(
            //                 'Entry',
            //                 style: TextStyle(fontSize: 18),
            //               ),
            //             ),
            //           ),
            //         ),
            //         Spacer(),
            //         Padding(
            //           padding: const EdgeInsets.only(right: 50),
            //           child: Container(
            //             decoration: BoxDecoration(
            //                 border: Border(
            //               bottom:
            //                   BorderSide(width: 5.0, color: Color(0xffFE96FA)),
            //             )),
            //             child: Text(
            //               'Exit',
            //               style: TextStyle(fontSize: 18),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   )),
            // ),
            my_exits.length == 0
                ? Center(child: Text('No records yet'))
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.blueAccent),
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text('Exit Date')),
                          DataColumn(label: Text('Exit Time')),
                          DataColumn(label: Text('Purpose of exit')),
                          DataColumn(label: Text('Token')),
                          DataColumn(label: Text('Entry Date')),
                          DataColumn(label: Text('Entry Time')),
                          DataColumn(label: Text('Hostel')),
                          DataColumn(label: Text('Room No.')),
                        ],
                        rows: my_exits
                            .map((element) => DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(element["exitTime"]
                                        .toDate()
                                        .toString()
                                        .substring(0,
                                            11))), //Extracting from Map element the value
                                    DataCell(Text(element["exitTime"]
                                        .toDate()
                                        .toString()
                                        .substring(11,
                                            19))), //Extracting from Map element the value
                                    DataCell(Text(element["purpose"])),
                                    DataCell(Text(element["token"].toString())),
                                    DataCell(element["entryTime"] != null
                                        ? Text(element["entryTime"]
                                            .toDate()
                                            .toString()
                                            .substring(0, 11))
                                        : Text("     ")),
                                    DataCell(element["entryTime"] != null
                                        ? Text(element["entryTime"]
                                            .toDate()
                                            .toString()
                                            .substring(11, 19))
                                        : Text("     ")),

                                    DataCell(Text(element["hostelName"])),
                                    DataCell(Text(element["roomNumber"])),
                                  ],
                                ))
                            .toList(),
                      ),
                    ),
                  ),
          ],
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return HomeScreenStudent();
                  }),
                );
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
                color: Color(0xffF989E7),
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
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
