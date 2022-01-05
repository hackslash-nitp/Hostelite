import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';

import 'package:hostelite/admin_screens/drawer_admin.dart';
import 'package:hostelite/admin_screens/edit_profile_Admin.dart';

import 'package:hostelite/admin_screens/alerts_admin.dart';
import 'package:hostelite/admin_screens/exit-recordsAdmin.dart';
import 'package:hostelite/models/user_model.dart';
import 'package:hostelite/admin_screens/pendingcomplaints_admin.dart';

UserModel userModel;

Future<void> saveTokenToDatabase(String token) async {
  String userId = FirebaseAuth.instance.currentUser.uid;

  await FirebaseFirestore.instance.collection("adminUsers").doc(userId).update({
    'tokens': FieldValue.arrayUnion([token]),
  });
}

class HomeScreenAdmin extends StatefulWidget {
  const HomeScreenAdmin({Key key}) : super(key: key);

  @override
  _HomeScreenAdminState createState() => _HomeScreenAdminState();
}

class _HomeScreenAdminState extends State<HomeScreenAdmin> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  Future getCurrentUserDataFunction() async {
    await FirebaseFirestore.instance
        .collection("adminUsers")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        userModel = UserModel.fromDocument(documentSnapshot);
      } else {
        print("Sorry");
      }
    });
  }

  var db = FirebaseFirestore.instance
      .collection(FirebaseAuth.instance.currentUser.uid)
      .get();

  void startTokenWork() async {
    String token = await FirebaseMessaging.instance.getToken();
    await saveTokenToDatabase(token);
    FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToDatabase);
  }

  @override
  void initState() {
    super.initState();
    startTokenWork();
  }

  @override
  Widget build(BuildContext context) {
    // getCurrentUserDataFunction();
    return WillPopScope(
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldkey,
          drawer: NavDrawerAdmin(),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(4, 25, 4, 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      MaterialButton(
                        height: 35,
                        minWidth: 30,
                        splashColor: Colors.pink,
                        onPressed: () {
                          _scaffoldkey.currentState.openDrawer();
                        },
                        child: Image(
                          image: AssetImage(
                              'assets/home_Screen_Student/Group 33636.png'),
                          width: 30,
                          height: 30,
                        ),
                      ),
                      SizedBox(width: 30),
                      Column(
                        children: [
                          Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                image: AssetImage('assets/H_of_Hostelite.jpg'),
                                width: 50,
                                height: 50,
                              ),
                              Image(
                                image: AssetImage('assets/ostellite.png'),
                                width: 100,
                                height: 50,
                              ),
                            ],
                          )),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image: AssetImage('assets/Rectangle 368.png'),
                                  width: 50,
                                  height: 10,
                                ),
                                SizedBox(width: 5),
                                Image(
                                  image: AssetImage(
                                      'assets/Your Hostel Companion.png'),
                                  width: 100,
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(
                        'Hello, ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(
                        "Let's manage your Hostel Things",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(
                        'Quick Access',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: MaterialButton(
                        color: Color(0xff51E71D),
                        focusElevation: 0,
                        autofocus: true,
                        minWidth: 100,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return PendingComplaints();
                            }),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            Image(
                              image: AssetImage(
                                  'assets/home_Screen_Student/2720490 1.png'),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'View',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  'Complaints',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: MaterialButton(
                        color: Color(0xffFFBCF4),
                        focusElevation: 0,
                        autofocus: true,
                        minWidth: 100,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return ExitListAdmin();
                            }),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Entry/Exit',
                                    style: TextStyle(
                                      color: Color(0xff743C7D),
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    'Reports',
                                    style: TextStyle(
                                      color: Color(0xff743C7D),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Image(
                              image: AssetImage(
                                'assets/home_Screen_Student/sign-in-4 1.png',
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                  onPressed: () {},
                  child: Icon(
                    Icons.home_filled,
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
        ),
      ),
      onWillPop: () => showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          title: Text('Warning'),
          content: Text('Do you really want to exit'),
          actions: [
            TextButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.pop(c, true);
                }),
            TextButton(
              child: Text('No'),
              onPressed: () => Navigator.pop(c, false),
            ),
          ],
        ),
      ),
    );
  }
}
