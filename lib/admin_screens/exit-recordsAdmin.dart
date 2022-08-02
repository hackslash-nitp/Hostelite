import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/admin_screens/alerts_admin.dart';
import 'package:hostelite/admin_screens/edit_profile_Admin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostelite/admin_screens/home_screen_Admin.dart';

class ExitListAdmin extends StatefulWidget {
  const ExitListAdmin({Key? key}) : super(key: key);

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
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
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
                data:
                    Theme.of(context).copyWith(dividerColor: Colors.blueAccent),
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
                              DataCell(
                                element["name"] != null
                                    ? Text(element["name"].toString())
                                    : Text("     "),
                              ),
                              DataCell(
                                element["rollNumber"] != null
                                    ? Text(element["rollNumber"].toString())
                                    : Text("     "),
                              ),
                              DataCell(
                                element["purpose"] != null
                                    ? Text(element["purpose"].toString())
                                    : Text("     "),
                              ),
                              DataCell(
                                element["token"] != null
                                    ? Text(element["token"].toString())
                                    : Text("     "),
                              ),
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
                              DataCell(
                                element["hostelName"] != null
                                    ? Text(element["hostelName"].toString())
                                    : Text("     "),
                              ),
                              DataCell(
                                element["roomNumber"] != null
                                    ? Text(element["roomNumber"].toString())
                                    : Text("     "),
                              ),
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
              MaterialButton(
                onPressed: () {},
                child: Icon(
                  Icons.graphic_eq,
                  color: Color(0xffF989E7),
                ),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
