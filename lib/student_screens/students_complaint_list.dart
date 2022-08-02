import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:hostelite/student_screens/edit_profile_Student.dart';
import 'package:hostelite/student_screens/home_screen_Student.dart';
import 'package:hostelite/student_screens/studentexitrecords.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentComplaintList extends StatefulWidget {
  const StudentComplaintList({Key? key}) : super(key: key);

  @override
  _StudentComplaintListState createState() => _StudentComplaintListState();
}

class _StudentComplaintListState extends State<StudentComplaintList> {
  List complaints = [];
  String userId = FirebaseAuth.instance.currentUser!.uid;
  var db = FirebaseFirestore.instance;
  var compl = FirebaseFirestore.instance
      .collection('studentUsers')
      .doc(FirebaseAuth.instance.currentUser!.uid)
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
    return ScreenUtilInit(
      builder: ((context, child) => Scaffold(
            appBar: AppBar(
              title: Text(
                'Your Complaints Status',
                style: TextStyle(
                  fontSize: 24.sp,
                ),
              ),
              backgroundColor: Color(0xFFFE96FA),
              foregroundColor: Color(0xFF4E4E4E),
            ),
            body: ListView.builder(
              itemCount: complaints.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(30.h),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 22.w, vertical: 15.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  complaints[index]["issue"],
                                  style: TextStyle(
                                      color: Color(0xff565656),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp),
                                ),
                                Text(
                                  complaints[index]["postedAt"]
                                      .toDate()
                                      .toString()
                                      .substring(0, 11),
                                  style: TextStyle(
                                    color: Color(0xFF9F9F9F),
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Color(0xffC1C1C1),
                            height: 25.h,
                            thickness: 2,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 13.h),
                            child: Card(
                              child: Image.network(
                                complaints[index]["imageUrl"],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 13.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Room No ${complaints[index]["roomNumber"]}"),
                                Text(
                                    "At ${complaints[index]["postedAt"].toDate().toString().substring(11, 19)}")
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 9.h, horizontal: 20.w),
                            child: Text(
                              complaints[index]["explanation"],
                              style: TextStyle(
                                  color: Color(0xff5C5C5C), fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 9.h, horizontal: 20.w),
                            child: Text(
                              "Status: " + complaints[index]["status"],
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 18.sp),
                            ),
                          ),
                        ],
                      )),
                );
              },
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreenStudent()));
                    },
                    child: Icon(
                      Icons.home_filled,
                    ),
                  ),
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
                ],
              ),
            ),
          )),
      designSize: const Size(414, 1100),
    );
  }
}

class Cardcomplaint extends StatelessWidget {
  final complaints;
  final index;
  const Cardcomplaint({Key? key, this.complaints, this.index})
      : super(key: key);

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
