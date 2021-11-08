import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/admin_screens/alerts_admin.dart';
import 'package:hostelite/admin_screens/edit_profile_Admin.dart';
import 'package:hostelite/entry-recordsAdmin.dart';
import 'package:hostelite/home_screen_Admin.dart';

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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return EntryListAdmin();
                          }),
                        );
                      },
                      child: Container(
                        child: Text(
                          'Entry',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                        bottom:
                            BorderSide(width: 5.0, color: Color(0xffFE96FA)),
                      )),
                      child: Text(
                        'Exit',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.blueAccent),
              child: DataTable(
                sortAscending: true,
                columns: [
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Time')),
                  DataColumn(label: Text('User email')),
                  DataColumn(label: Text('Roll No.')),
                  DataColumn(label: Text('purpose')),
                  DataColumn(label: Text('Hostel')),
                  DataColumn(label: Text('Room No.')),
                ],
                rows: exits
                    .map((element) => DataRow(
                          cells: <DataCell>[
                            DataCell(Text(element["time"]
                                .toDate()
                                .toString()
                                .substring(0,
                                    11))), //Extracting from Map element the value
                            DataCell(Text(element["time"]
                                .toDate()
                                .toString()
                                .substring(11,
                                    19))), //Extracting from Map element the value
                            DataCell(Text(element["name"])),
                            DataCell(Text(element["rollNumber"])),
                            DataCell(Text(element["purpose"])),
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
