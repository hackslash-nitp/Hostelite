import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/alerts_admin.dart';
import 'package:hostelite/home_screen_Admin.dart';
import 'package:hostelite/pendingcomplaints_admin.dart';
import 'package:hostelite/rejected_complaints.dart';

import 'edit_profile_Admin.dart';

class ViewComplaintsAdmin extends StatefulWidget {
  const ViewComplaintsAdmin({Key key}) : super(key: key);

  @override
  _ViewComplaintsAdminState createState() => _ViewComplaintsAdminState();
}

class _ViewComplaintsAdminState extends State<ViewComplaintsAdmin> {
  String dropdownvalue = "Category";
  var items = [
    'Category',
    'Infrastructure',
    'Sanitation',
    'Water',
    'Electricity',
    'Wifi',
    'Others'
  ];
  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          leading: BackButton(color: Colors.black),
          title: Text(
            'View Complaints',
            style: TextStyle(
              color: Color(0xff4E4E4E),
            ),
          ),
          backgroundColor: Color(0xffFE96FA),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Text(
                          'Status : ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff4BB227)),
                          ),
                          onPressed: null,
                          child: const Text(
                            'Sorted',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationThickness: 4,
                                color: Color(0xff4BB227)),
                          ),
                        ),
                        Spacer(),
                        VerticalDivider(
                          color: Colors.green,
                          thickness: 2,
                          width: 2,
                        ),
                        Spacer(),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.red,
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return PendingComplaints();
                              }),
                            );
                          },
                          child: const Text(
                            'Pending',
                            style: TextStyle(color: Color(0xffFBC02D)),
                          ),
                        ),
                        Spacer(),
                        VerticalDivider(
                          color: Colors.lightBlue,
                          thickness: 2,
                          width: 4,
                        ),
                        Spacer(),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return RejectedComplaints();
                              }),
                            );
                          },
                          child: const Text(
                            'Rejected',
                            style: TextStyle(color: Color(0xffFF4646)),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.tealAccent.withOpacity(0.1),
                        spreadRadius: 5),
                  ]),
              child: Row(
                children: [
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                    child: DropdownButton(
                      value: dropdownvalue,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                            value: items, child: Text(items));
                      }).toList(),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownvalue = newValue;
                        });
                      },
                    ),
                  ),
                  //Drop Down DatePicker Package required to be installed in pubspec

                  //child: DropdownDatePicker(
                  //firstDate: ValidDate(year: now.year - 100, month: 1, day: 1),
                  //lastDate: ValidDate(year: now.year, month: now.month, day: now.month),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("studentUsers")
                  .doc()
                  .collection("complaints")
                  .snapshots(),
              builder: (context, snapshots) {
                debugPrint('o/p'+snapshots.toString());

                return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index){
                      return Text('abc');
                    });
              },
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.yellow,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ramesh Kumar',
                                  style: TextStyle(
                                      color: Color(0xff565656), fontSize: 15),
                                ),
                                Text(
                                  'Room No. 087',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              DateTime.now().day.toString() +
                                  '.' +
                                  DateTime.now().month.toString() +
                                  '.' +
                                  DateTime.now().year.toString(),
                              style: TextStyle(color: Color(0xff9F9F9F)),
                            )
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 5,
                        ),
                        Image(
                          image: AssetImage(
                              'assets/home_Screen_Student/2720490 1.png'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Title of Issue',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1A1919),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            'Sir I went to purchase a book , but while returning it satrted raining . So there was                              no any options left for me then waiting at  the store until the rain stopped.'),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              DateTime.now().toString(),
                              style: TextStyle(color: Color(0xff9F9F9F)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ramesh Kumar',
                                  style: TextStyle(
                                      color: Color(0xff565656), fontSize: 15),
                                ),
                                Text(
                                  'Room No. 087',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              DateTime.now().day.toString() +
                                  '.' +
                                  DateTime.now().month.toString() +
                                  '.' +
                                  DateTime.now().year.toString(),
                              style: TextStyle(color: Color(0xff9F9F9F)),
                            )
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 5,
                        ),
                        Image(
                          image: AssetImage(
                              'assets/home_Screen_Student/2720490 1.png'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Title of Issue',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1A1919),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            'Sir I went to purchase a book , but while returning it satrted raining . So there was                              no any options left for me then waiting at  the store until the rain stopped.'),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              DateTime.now().toString(),
                              style: TextStyle(color: Color(0xff9F9F9F)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ramesh Kumar',
                                  style: TextStyle(
                                      color: Color(0xff565656), fontSize: 15),
                                ),
                                Text('Room No. 087'),
                              ],
                            ),
                            Spacer(),
                            Text(
                              DateTime.now().day.toString() +
                                  '.' +
                                  DateTime.now().month.toString() +
                                  '.' +
                                  DateTime.now().year.toString(),
                              style: TextStyle(color: Color(0xff9F9F9F)),
                            )
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            'Sir I went to purchase a book , but while returning it satrted raining . So there was                              no any options left for me then waiting at  the store until the rain stopped.'),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              DateTime.now().toString(),
                              style: TextStyle(color: Color(0xff9F9F9F)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
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
              onPressed: () {},
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
