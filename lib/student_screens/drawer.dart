import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/student_screens/edit_profile_Student.dart';
import 'package:hostelite/student_screens/loginStudent.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
            ColoredBox(
              color: Color(0xffFE96FA),
            ),
            ListTile(
              title: Text(
                _auth.currentUser.displayName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              tileColor: Color(0xffFE96FA),
            ),
            ColoredBox(
              color: Color(0xffFE96FA),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EditProfileStudent();
                      }))
                    }),
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
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginStudent()));
              },
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
            ),
            ListTile(
              tileColor: Color(0xffFE96FA),
            ),
            ListTile(
              tileColor: Color(0xffFE96FA),
            ),
          ],
        ),
      ),
    );
  }
}
