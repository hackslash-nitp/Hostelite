import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/student_screens/complaintStudent.dart';
import 'package:hostelite/student_screens/drawer.dart';
import 'package:hostelite/student_screens/edit_profile_Student.dart';
import 'package:hostelite/student_screens/mark_exit.dart';
import 'package:hostelite/student_screens/exit_entryStudent.dart';
import 'package:hostelite/student_screens/studentexitrecords.dart';
import 'package:hostelite/student_screens/students_complaint_list.dart';

class HomeScreenStudent extends StatefulWidget {
  const HomeScreenStudent({Key key}) : super(key: key);

  @override
  _HomeScreenStudentState createState() => _HomeScreenStudentState();
}

class _HomeScreenStudentState extends State<HomeScreenStudent> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        child: Scaffold(
          key: _scaffoldkey,
          drawer: NavDrawer(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      MaterialButton(
                        height: 35,
                        minWidth: 30,
                        splashColor: Colors.pink,
                        onPressed: () {
                          _scaffoldkey.currentState.openDrawer();
                        },
                        child: Image(
                          image: AssetImage(
                              'assets/home_Screen_Student/Group 33636.png'),
                          width: 30,
                          height: 30,
                        ),
                      ),
                      SizedBox(width: 30),
                      Column(
                        children: [
                          Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                image: AssetImage('assets/H_of_Hostelite.jpg'),
                                width: 50,
                                height: 50,
                              ),
                              Image(
                                image: AssetImage('assets/ostellite.png'),
                                width: 100,
                                height: 50,
                              ),
                            ],
                          )),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image: AssetImage('assets/Rectangle 368.png'),
                                  width: 50,
                                  height: 10,
                                ),
                                SizedBox(width: 5),
                                Image(
                                  image: AssetImage(
                                      'assets/Your Hostel Companion.png'),
                                  width: 100,
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 40),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Hello, ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Let's manage your Hostel Things",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Quick Access',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 200,
                    child: MaterialButton(
                      // focusElevation: 80,
                      elevation: 10,
                      color: Color(0xffFFFFFE),
                      // autofocus: true,
                      minWidth: MediaQuery.of(context).size.width,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
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
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 100,
                        child: MaterialButton(
                          elevation: 10,
                          color: Color(0xffFFBCF4),
                          minWidth: MediaQuery.of(context).size.width,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
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
                                width: 200,
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(height: 20),
                                  Text(
                                    'Mark',
                                    style: TextStyle(
                                      color: Colors.redAccent[400],
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Entry',
                                    style: TextStyle(
                                      color: Colors.redAccent[400],
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
                      SizedBox(height: 10),
                      Container(
                        height: 100,
                        child: MaterialButton(
                          elevation: 10,
                          color: Color(0xff51E71D),
                          minWidth: MediaQuery.of(context).size.width,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
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
                                width: 200,
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(height: 20),
                                  Text(
                                    'Mark',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
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
                  SizedBox(
                    height: 20,
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
                  SizedBox(height: 30),
                ],
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
                  onPressed: () {},
                  child: Icon(
                    Icons.home_filled,
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
        ),
        onWillPop: () => showDialog<bool>(
          context: context,
          builder: (c) => AlertDialog(
            title: Text('Warning'),
            content: Text('Do you really want to exit'),
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
        ),
      ),
    );
  }
}
