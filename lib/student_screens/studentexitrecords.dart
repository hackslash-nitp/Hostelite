import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/student_screens/edit_profile_Student.dart';
import 'package:hostelite/student_screens/home_screen_Student.dart';
import 'package:hostelite/student_screens/students_complaint_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentExitRecordList extends StatefulWidget {
  const StudentExitRecordList({Key? key}) : super(key: key);

  @override
  _StudentEntryRecordListState createState() => _StudentEntryRecordListState();
}

class _StudentEntryRecordListState extends State<StudentExitRecordList> {
  List myExits = [];
  String userId = FirebaseAuth.instance.currentUser!.uid;
  var db = FirebaseFirestore.instance;
  var entry = FirebaseFirestore.instance
      .collection('studentUsers')
      .doc(FirebaseAuth.instance.currentUser!.uid)
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
        myExits = value.docs;
      });
      myExits.sort((b, a) => a["time"].compareTo(b["time"]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: ((context, child) => Scaffold(
            appBar: AppBar(
              title: Text('Your Exit/Entry Records'),
              backgroundColor: Color(0xffFE96FA),
              foregroundColor: Color(0xFF4E4E4E),
              elevation: 5,
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
                  myExits.length == 0
                      ? Padding(
                          padding: EdgeInsets.all(20.h),
                          child: Center(child: Text('No records yet')),
                        )
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
                              rows: myExits
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
                                          DataCell(
                                            element["purpose"] != null
                                                ? Text(element["purpose"]
                                                    .toString())
                                                : Text("     "),
                                          ),
                                          DataCell(Text(
                                              element["token"].toString())),
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

                                          DataCell(
                                            element["hostelName"] != null
                                                ? Text(element["hostelName"]
                                                    .toString())
                                                : Text("     "),
                                          ),
                                          DataCell(
                                            element["roomNumber"] != null
                                                ? Text(element["roomNumber"]
                                                    .toString())
                                                : Text("     "),
                                          ),
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
                borderRadius: BorderRadius.circular(35.r),
                border: Border.all(
                  color: Colors.grey[300]!,
                ),
              ),
              height: 84.h,
              width: 414.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
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
                ],
              ),
            ),
          )),
    );
  }
}
