import 'dart:convert';

import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.pinkAccent[100],
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage(''),
              radius: 30,
            ),
          ),
          ListTile(
            title: Text('Siddharth',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            ),
            tileColor: Colors.pinkAccent[100],
          ),
          ListTile(
            tileColor: Colors.pinkAccent[100],
            title: Text('Room No.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
            ),
            ),
          ),
          ColoredBox(
            color: Colors.pinkAccent[100],
          ),
          ListTile(
            tileColor: Colors.pinkAccent[100],
            leading: Icon(Icons.edit),
            title: Text('Edit Profile',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            ),
            onTap: () => {},
          ),
          ListTile(
            tileColor: Colors.pinkAccent[100],
            leading: Icon(Icons.notifications),
            title: Text('Notification',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            ),
            onTap: () => {},
          ),
          ListTile(
            tileColor: Colors.pinkAccent[100],
            leading: Icon(Icons.report_problem),
            title: Text('Report Issue',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            ),
            onTap: () => {},
          ),
          ListTile(
            tileColor: Colors.pinkAccent[100],
            leading: Icon(Icons.system_update_alt_outlined),
            title: Text('App Updates',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            ),
            onTap: () => {},
          ),
          ListTile(
            tileColor: Colors.pinkAccent[100],
            leading: Icon(Icons.quick_contacts_dialer_outlined),
            title: Text('Contact Us',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            ),
            onTap: () => {},
          ),
          ListTile(
            tileColor: Colors.pinkAccent[100],
            leading: Icon(Icons.logout),
            title: Text('Log Out',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            ),
            onTap: () => {},
          ),
          SizedBox(height: 50,
          child: ColoredBox(
            color: Colors.pinkAccent[100],
          ),
          ),
          ListTile(
            title: Text('App Version 1.0',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
            ),),
            tileColor: Colors.pinkAccent[100],
          )
        ],
      ),
    );
  }
}
