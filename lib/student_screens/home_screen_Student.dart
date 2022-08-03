import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/student_screens/complaintStudent.dart';
import 'package:hostelite/student_screens/drawer.dart';
import 'package:hostelite/student_screens/edit_profile_Student.dart';
import 'package:hostelite/student_screens/mark_exit.dart';
import 'package:hostelite/student_screens/exit_entryStudent.dart';
import 'package:hostelite/student_screens/studentexitrecords.dart';
import 'package:hostelite/student_screens/students_complaint_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenStudent extends StatefulWidget {
  const HomeScreenStudent({Key? key}) : super(key: key);

  @override
  _HomeScreenStudentState createState() => _HomeScreenStudentState();
}

class _HomeScreenStudentState extends State<HomeScreenStudent> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: ((context, child) => SafeArea(
            child: WillPopScope(
              child: Scaffold(
                key: _scaffoldkey,
                drawer: NavDrawer(),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            MaterialButton(
                              splashColor: Colors.pink,
                              onPressed: () {
                                _scaffoldkey.currentState!.openDrawer();
                              },
                              child: Image(
                                image: AssetImage(
                                    'assets/home_Screen_Student/Group 33636.png'),
                                width: 45.w,
                                height: 38.h,
                              ),
                            ),
                            Image(
                              image: AssetImage('assets/Hostellite.png'),
                              width: 170.w,
                              height: 60.h,
                            ),
                            MaterialButton(
                              height: 50.h,
                              minWidth: 45.w,
                              onPressed: () {},
                              child: Icon(
                                Icons.notifications_active,
                                color: Color(0xFFF989E7),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25.h),
                        Text(
                          'Hello, ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Let's manage your Hostel Things",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF858585),
                          ),
                        ),
                        SizedBox(height: 47.h),
                        Text(
                          'Quick Access',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 47.h),
                        Container(
                          height: 270.h,
                          child: MaterialButton(
                            // focusElevation: 80,
                            elevation: 10,
                            color: Color(0xffFFFFFE),
                            // autofocus: true,
                            minWidth: MediaQuery.of(context).size.width,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return StudentComplaint();
                                }),
                              );
                            },
                            child: Column(
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      'assets/home_Screen_Student/2720490 1.png'),
                                ),
                                Text(
                                  'Post a Complaint',
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Column(
                          children: <Widget>[
                            Container(
                              height: 135.h,
                              child: MaterialButton(
                                elevation: 10,
                                color: Color(0xffFFBCF4),
                                minWidth: MediaQuery.of(context).size.width,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return MarkingEntry();
                                    }),
                                  );
                                },
                                child: Row(
                                  children: <Widget>[
                                    Image(
                                      image: AssetImage(
                                          'assets/home_Screen_Student/bermuda-747 1.png'),
                                      width: 200.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Mark',
                                          style: TextStyle(
                                            color: Color(0xFF7E1D7B),
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Entry',
                                          style: TextStyle(
                                            color: Color(0xFF7E1D7B),
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Container(
                              height: 135.h,
                              child: MaterialButton(
                                elevation: 10,
                                color: Color(0xff51E71D),
                                minWidth: MediaQuery.of(context).size.width,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return MarkingExit();
                                    }),
                                  );
                                },
                                child: Row(
                                  children: <Widget>[
                                    Image(
                                      image: AssetImage(
                                          'assets/home_Screen_Student/sign-in-4 1.png'),
                                      width: 200.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Mark',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          'Exit',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Container(
                        //   width: 350,
                        //   height: 265,
                        //   child: SingleChildScrollView(
                        //     child: TableCalendar(
                        //       initialCalendarFormat: CalendarFormat.month,
                        //       calendarStyle: CalendarStyle(
                        //         highlightSelected: true,
                        //         todayStyle: TextStyle(
                        //           fontSize: 8,
                        //           fontWeight: FontWeight.bold,
                        //           color: Colors.black87,
                        //         ),
                        //       ),
                        //       headerStyle: HeaderStyle(
                        //         centerHeaderTitle: true,
                        //         formatButtonDecoration: BoxDecoration(
                        //           color: Colors.white,
                        //           borderRadius: BorderRadius.circular(15),
                        //         ),
                        //         formatButtonShowsNext: true,
                        //         formatButtonTextStyle: TextStyle(
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //       startingDayOfWeek: StartingDayOfWeek.monday,
                        //       calendarController: _controller,
                        //       /*onDaySelected: (date,evants){
                        //         print(date.toUtc());
                        //       },*/
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.home_filled,
                          color: Color(0xffF989E7),
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
                          Icons.add_chart,
                        ),
                      ),
                      //SizedBox(width: 10),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacement(
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
              ),
              onWillPop: (() => showDialog<bool>(
                    context: context,
                    builder: (c) => AlertDialog(
                      title: Text('Warning'),
                      content: Text('Do you really want to exit?'),
                      actions: [
                        TextButton(
                            child: Text('Yes'),
                            // onPressed: () => Navigator.pop(c, true),
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.pop(c, true);
                            }),
                        TextButton(
                          child: Text('No'),
                          onPressed: () => Navigator.pop(c, false),
                        ),
                      ],
                    ),
                  ).then((value) => value!)),
            ),
          )),
      designSize: const Size(414, 1100),
    );
  }
}
