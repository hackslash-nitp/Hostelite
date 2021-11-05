import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/edit_profile_Student.dart';
import 'package:hostelite/loginStudent.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;



  final displayPicUrlSnapshot = FirebaseFirestore.instance.collection("displayPics")
      .doc(FirebaseAuth.instance.currentUser.uid).get().then((value) {
       var userpicurl = value.data()["dpUrl"];
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(

        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        children: <Widget>[

          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xffFE96FA),
            ),
            child: CircleAvatar(
              // backgroundImage: NetworkImage(userpicurl),
              radius: 30,
            ),
          ),
          ColoredBox(
            color: Color(0xffFE96FA),
          ),
          ListTile(
            title: Text(
              _auth.currentUser.displayName,
              // displayPicUrlSnapshot.data()['dpUrl'],
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
          // ListTile(
          //   tileColor: Color(0xffFE96FA),
          //   leading: Icon(Icons.notifications),
          //   title: Text(
          //     'Notification',
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 18,
          //     ),
          //   ),
          //   onTap: () {},
          // ),
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
          // ListTile(
          //   tileColor: Color(0xffFE96FA),
          //   leading: Icon(Icons.system_update_alt_outlined),
          //   title: Text(
          //     'App Updates',
          //     style: TextStyle(
          //       fontSize: 18,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          //   onTap: () => {},
          // ),
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
          ),ListTile(

            tileColor: Color(0xffFE96FA),
          ),
        ],
      ),
    );
  }
}

