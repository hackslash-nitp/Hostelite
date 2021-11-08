import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/admin_screens/alerts_admin.dart';
import 'package:hostelite/admin_screens/edit_profile_Admin.dart';
import 'package:hostelite/admin_screens/home_screen_Admin.dart';
import 'package:hostelite/admin_screens/loginAdmin.dart';

class NavDrawerAdmin extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final db = FirebaseFirestore.instance
      .collection("adminUsers")
      .doc(FirebaseAuth.instance.currentUser.uid)
      .collection("profile")
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color(0xffFE96FA),
      ),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xffFE96FA),
              ),
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('displayPics')
                      .where("userUid",
                          isEqualTo: FirebaseAuth.instance.currentUser.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    String dataUrl = snapshot.data.docs[0]["dpUrl"];
                    return CircleAvatar(
                      radius: 85,
                      backgroundColor: Colors.orange[100],
                      backgroundImage: dataUrl != " "
                          ? NetworkImage(dataUrl)
                          : AssetImage('assets/nodppic.jfif'),
                    );
                  }),
            ),
            StreamBuilder<Object>(
                stream: FirebaseFirestore.instance
                    .collection("adminUsers")
                    .doc(FirebaseAuth.instance.currentUser.uid)
                    .collection("profile")
                    .snapshots(),
                builder: (context, snapshot) {
                  return ListTile(
                    title: Text(
                      _auth.currentUser.displayName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff636363),
                      ),
                    ),
                    tileColor: Color(0xffFE96FA),
                  );
                }),
            ListTile(
              tileColor: Color(0xffFE96FA),
              title: Text(
                'Hostel In-Charge',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            ColoredBox(
              color: Color(0xffFFBCF4),
            ),
            ListTile(
              tileColor: Color(0xffFE96FA),
              leading: Icon(Icons.edit),
              title: Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return EditProfileAdmin();
                  }),
                )
              },
            ),
            ListTile(
              tileColor: Color(0xffFE96FA),
              leading: Icon(Icons.notifications),
              title: Text(
                'Alerts',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Alerts();
                  }),
                )
              },
            ),
            ListTile(
              tileColor: Color(0xffFE96FA),
              leading: Icon(Icons.report_problem),
              title: Text(
                'Report Issue',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () => {},
            ),
            ListTile(
              tileColor: Color(0xffFE96FA),
              leading: Icon(Icons.quick_contacts_dialer_outlined),
              title: Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () => {},
            ),
            ListTile(
              tileColor: Color(0xffFE96FA),
              leading: Icon(Icons.logout),
              title: Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () async {
                _auth.signOut();
                print('signed out');
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginAdmin()));
              },
              // onTap: () => {
              //   // print('signed out')
              //   _auth.signOut()
              //
              // },
            ),
            SizedBox(
              height: 50,
              child: ColoredBox(
                color: Color(0xffFE96FA),
              ),
            ),
            ListTile(
              title: Text(
                'App Version 1.0',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              tileColor: Color(0xffFE96FA),
            )
          ],
        ),
      ),
    );
  }
}
