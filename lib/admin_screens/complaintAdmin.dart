import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:hostelite/admin_screens/alerts_admin.dart';
import 'package:hostelite/admin_screens/exit-recordsAdmin.dart';

import 'package:hostelite/admin_screens/home_screen_Admin.dart';
import 'package:hostelite/admin_screens/pendingcomplaints_admin.dart';

import 'edit_profile_Admin.dart';

class ViewComplaintsAdmin extends StatefulWidget {
  const ViewComplaintsAdmin({Key key}) : super(key: key);

  @override
  _ViewComplaintsAdminState createState() => _ViewComplaintsAdminState();
}

class _ViewComplaintsAdminState extends State<ViewComplaintsAdmin> {
  final now = DateTime.now();
  var db = FirebaseFirestore.instance;

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
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("sortedComplaints")
                  .orderBy("postedAt", descending: true)
                  .snapshots(),
              builder: (context, snapshots) {
                if (!snapshots.hasData) {
                  return CircularProgressIndicator();
                }

                return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshots.data.size,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshots.data.docs[index];
                      return SingleChildScrollView(
                        child: Container(
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
                                        StreamBuilder<QuerySnapshot>(
                                            stream: db
                                                .collection("displayPics")
                                                .where("userUid",
                                                    isEqualTo: data["userUid"])
                                                .snapshots(),
                                            builder: (context, snapshot) {
                                              String dataUrl = snapshot
                                                  .data.docs[0]["dpUrl"];
                                              return CircleAvatar(
                                                radius: 25,
                                                backgroundColor:
                                                    Colors.orange[100],
                                                backgroundImage: dataUrl != " "
                                                    ? NetworkImage(dataUrl)
                                                    : AssetImage(
                                                        'assets/nodppic.jfif'),
                                              );
                                            }),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data["name"],
                                              style: TextStyle(
                                                  color: Color(0xff565656),
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Text(
                                          "Room No." + data["roomNumber"],
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Posted On " +
                                          data["postedAt"]
                                              .toDate()
                                              .toString()
                                              .substring(2, 11) +
                                          " At " +
                                          data["postedAt"]
                                              .toDate()
                                              .toString()
                                              .substring(11, 19),
                                      style:
                                          TextStyle(color: Color(0xff9F9F9F)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Image(
                                      image: NetworkImage(data["imageUrl"]),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      data["issue"],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff1A1919),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(data["explanation"]),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              },
            ),
            SizedBox(
              height: 20,
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
