import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/admin_screens/alerts_admin.dart';
import 'package:hostelite/admin_screens/edit_profile_Admin.dart';

import 'package:hostelite/admin_screens/home_screen_Admin.dart';

class ExitListAdmin extends StatefulWidget {
  const ExitListAdmin({Key key}) : super(key: key);

  @override
  _ExitListAdminState createState() => _ExitListAdminState();
}

class _ExitListAdminState extends State<ExitListAdmin> {
  var db = FirebaseFirestore.instance;
  List exits = [];

  @override
  void initState() {
    super.initState();
    db.collection('Exits').get().then((value) {
      setState(() {
        exits = value.docs;
      });

      exits.sort((b, a) => a["time"].compareTo(b["time"]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          leading: BackButton(color: Colors.black),
          title: Text(
            'Entry-Exit Reports',
            style: TextStyle(
              color: Color(0xff4E4E4E),
            ),
          ),
          backgroundColor: Color(0xffFE96FA),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.blueAccent),
              child: DataTable(
                sortAscending: true,
                columns: [
                  DataColumn(label: Text('Exit Date')),
                  DataColumn(label: Text('Exit Time')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Roll No.')),
                  DataColumn(label: Text('Purpose of exit')),
                  DataColumn(label: Text('Token')),
                  DataColumn(label: Text('Entry Date')),
                  DataColumn(label: Text('Entry Time')),
                  DataColumn(label: Text('Hostel')),
                  DataColumn(label: Text('Room No.')),
                ],
                rows: exits
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
                                .substring(11, 19))),
                            DataCell(Text(element["name"])),
                            DataCell(Text(element["rollNumber"])),
                            DataCell(Text(element["purpose"])),
                            DataCell(Text(element["token"].toString())),
                            DataCell(element["entryTime"] != null
                                ? Text(element["entryTime"]
                                    .toDate()
                                    .toString()
                                    .substring(0, 11))
                                : Text("   ")),
                            DataCell(element["entryTime"] != null
                                ? Text(element["entryTime"]
                                    .toDate()
                                    .toString()
                                    .substring(11, 19))
                                : Text("   ")),
                            DataCell(Text(element["hostelName"])),
                            DataCell(Text(element["roomNumber"])),
                          ],
                        ))
                    .toList(),
              ),
            ),
          ),
        ]),
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
