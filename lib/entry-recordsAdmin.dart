import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:hostelite/admin_screens/alerts_admin.dart';
import 'package:hostelite/admin_screens/edit_profile_Admin.dart';
import 'package:hostelite/exit-recordsAdmin.dart';
import 'package:hostelite/home_screen_Admin.dart';
import 'package:hostelite/student_screens/home_screen_Student.dart';
import 'package:hostelite/rejected_complaints.dart';
import 'package:hostelite/shared_files/decoration.dart';

class EntryListAdmin extends StatefulWidget {
  const EntryListAdmin({Key key}) : super(key: key);

  @override
  _EntryListAdminState createState() => _EntryListAdminState();
}

class _EntryListAdminState extends State<EntryListAdmin> {
  var db = FirebaseFirestore.instance;
  List entries = [];

  @override
  void initState() {
    super.initState();
    db.collection('Entries').get().then((value) {
      setState(() {
        entries = value.docs;
      });
      entries.sort((b, a) => a["time"].compareTo(b["time"]));
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                          bottom:
                              BorderSide(width: 5.0, color: Color(0xffFE96FA)),
                        )),
                        child: Text(
                          'Entry',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return ExitListAdmin();
                            }),
                          );
                        },
                        child: Container(
                          child: Text(
                            'Exit',
                            style: TextStyle(fontSize: 18),
                          ),
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
                data:
                    Theme.of(context).copyWith(dividerColor: Colors.blueAccent),
                child: DataTable(
                  sortAscending: true,
                  columns: [
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Time')),
                    DataColumn(label: Text('User email')),
                    DataColumn(label: Text('Roll No.')),
                    DataColumn(label: Text('Location')),
                    DataColumn(label: Text('Hostel')),
                    DataColumn(label: Text('Room No.')),
                  ],
                  rows: entries
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
                              DataCell(Text(element["location"])),
                              DataCell(Text(element["hostel"])),
                              DataCell(Text(element["roomNumber"])),
                            ],
                          ))
                      .toList(),
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     child: ListView.builder(
            //       shrinkWrap: true,
            //       itemCount: entries.length,
            //       itemBuilder: (BuildContext context, int index){
            //         return Container(
            //           child: Card(
            //             child: Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(entries[index]["name"]),
            //                   Text(
            //                        entries[index]["name"],
            //                     style: TextStyle(
            //                       fontSize: 18,
            //                       color: Color(0xffFF5A4C4C)
            //                     ),
            //                   ),
            //                   Text(
            //                     entries[index]["rollNumber"]
            //                   ),
            //                   Text(
            //                       entries[index]["time"]
            //
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),

      // Column(
      //   children: [SizedBox(height: 10,),
      //   Container(
      //
      //     alignment: AlignmentDirectional.topEnd,
      //     child: Padding(
      //
      //       padding: EdgeInsets.fromLTRB(0, 5, 15, 5),
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
      //   ),
      //   SizedBox(height: 10.0,),

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
