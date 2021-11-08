import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/admin_screens/edit_profile_Admin.dart';
import 'package:hostelite/admin_screens/exit-recordsAdmin.dart';
import 'package:hostelite/admin_screens/home_screen_Admin.dart';

class Alerts extends StatefulWidget {
  const Alerts({Key key}) : super(key: key);

  @override
  _AlertsState createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  var db = FirebaseFirestore.instance;
  List entries = [];

  @override
  void initState() {
    super.initState();
    db.collection('Alerts').get().then((value) {
      setState(() {
        entries = value.docs;
      });
    });
  }

  String dropdownvalue = "Hostel";
  var items = ['Hostel', 'Ganga', 'Kosi', 'Son', 'Brahmaputra'];
  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          'Alerts',
          style: TextStyle(
            color: Color(0xff4E4E4E),
          ),
        ),
        backgroundColor: Color(0xffFE96FA),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //     boxShadow:[ BoxShadow(
            //
            //       color: Colors.tealAccent.withOpacity(0.1),
            //       spreadRadius: 5
            //     ),
            //     ]
            //   ),
            //   child: Row(
            //   children: [
            //     Padding(
            //       padding:EdgeInsets.fromLTRB(30, 5, 30, 5),
            //       child: DropdownButton(
            //
            //         value: dropdownvalue,
            //         icon: Icon(Icons.keyboard_arrow_down),
            //         items:items.map((String items) {
            //           return DropdownMenuItem(
            //               value: items,
            //               child: Text(items)
            //           );
            //         }
            //         ).toList(),
            //         onChanged: (String newValue){
            //           setState(() {
            //             dropdownvalue = newValue;
            //           });
            //         },
            //       ),
            //     ),
            //     Spacer(),
            //     Padding(
            //       padding:EdgeInsets.fromLTRB(30, 5, 30, 5),
            //       child: DropdownButton(
            //
            //         value: dropdownvalue,
            //         icon: Icon(Icons.keyboard_arrow_down),
            //         items:items.map((String items) {
            //           return DropdownMenuItem(
            //               value: items,
            //               child: Text(items)
            //           );
            //         }
            //         ).toList(),
            //         onChanged: (String newValue){
            //           setState(() {
            //             dropdownvalue = newValue;
            //           });
            //         },
            //       ),
            //     ),
            //       //Drop Down DatePicker Package required to be installed in pubspec
            //
            //       //child: DropdownDatePicker(
            //         //firstDate: ValidDate(year: now.year - 100, month: 1, day: 1),
            //         //lastDate: ValidDate(year: now.year, month: now.month, day: now.month),
            //
            //
            //   ],
            //   ),
            // ),
            //
            //
            // SizedBox(height: 20,),

            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('alerts')
                    .orderBy("time", descending: true)
                    .snapshots(),
                builder: (context, snapshots) {
                  return (!snapshots.hasData)
                      ? CircularProgressIndicator()
                      : SingleChildScrollView(
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                                itemCount: snapshots.data.docs.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot data =
                                      snapshots.data.docs[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Card(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'User email: ',
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                    Text(
                                                      data['name'],
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Roll No: ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      data['rollNumber'],
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Room No: ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      data['roomNumber'],
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Hostel: ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      data['hostel'],
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Date: ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      data['time']
                                                          .toDate()
                                                          .toString()
                                                          .substring(0, 11),
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Time: ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      data['time']
                                                          .toDate()
                                                          .toString()
                                                          .substring(11, 19),
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Position: ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      data['position']
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        );
                })
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
                    return HomeScreenAdmin();
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
                    return ExitListAdmin();
                  }),
                );
              },
              child: Icon(
                Icons.graphic_eq,
              ),
            ),
            Spacer(),
            //SizedBox(width: 10),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Alerts();
                  }),
                );
              },
              child: Icon(
                Icons.add_alert,
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
                    return EditProfileAdmin();
                  }),
                );
              },
              child: Icon(
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
