import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/edit_profile_Student.dart';
import 'package:hostelite/home_screen_Student.dart';
import 'package:hostelite/students_complaint_list.dart';
import 'package:hostelite/studentsentryrecords.dart';

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
      .collection('exit');

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


    });
  }
  @override
  Widget build(BuildContext context) {
    return my_exits.length == 0 ?  Scaffold(body: Center(child: CircularProgressIndicator())) :
    Scaffold(
        appBar: AppBar(
          title: Text('Your Exit/Entry Records'),
          backgroundColor: Color(0xffFE96FA),
          elevation: 0,
        ),
        body: SingleChildScrollView(

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  child:Padding(

                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:50.0),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return StudentEntryRecordList();
                                }),
                              );
                            },
                            child: Container(
                              child: Text('Entry',style: TextStyle(
                                fontSize: 18
                              ),),
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 50),

                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(

                                bottom: BorderSide(

                                    width: 5.0, color: Color(0xffFE96FA)),
                              )
                            ),
                            child: Text('Exit',style: TextStyle(
                              fontSize: 18
                            ),),
                          ),
                        ),

                      ],
                    ),
                  )
                ),
              ),


              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.blueAccent),

                  child: DataTable(


                    columns: [

                      DataColumn(label: Text('Time')),
                      DataColumn(label: Text('Purpose of exit')),
                    ],
                    rows:
                    my_exits.map((element) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(element["time"])), //Extracting from Map element the value
                        DataCell(Text(element["purpose"])),

                      ],
                    )
                    ).toList(),
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
                  MaterialPageRoute(
                      builder: (context) {
                        return HomeScreenStudent( );
                      }
                  ),
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
                color:Color(0xffF989E7),
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
