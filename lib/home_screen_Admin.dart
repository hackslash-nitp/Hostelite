import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:hostelite/complaintAdmin.dart';
import 'package:hostelite/drawer_admin.dart';
import 'package:hostelite/edit_profile_Admin.dart';
import 'package:hostelite/exit-entryAdmin.dart';
import 'package:hostelite/alerts_admin.dart';
import 'package:hostelite/models/user_model.dart';

UserModel userModel;

class HomeScreenAdmin extends StatefulWidget {
  const HomeScreenAdmin({Key key}) : super(key: key);

  @override
  _HomeScreenAdminState createState() => _HomeScreenAdminState();
}

class _HomeScreenAdminState extends State<HomeScreenAdmin> {

  Future getCurrentUserDataFunction()  async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot){
      if (documentSnapshot.exists){
        userModel = UserModel.fromDocument(documentSnapshot);
      }else{
        print("Sorry");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getCurrentUserDataFunction();
    return SafeArea(
      child: Scaffold(
          drawer: NavDrawerAdmin(),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(4,25,4,0),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) {
                                return  NavDrawerAdmin();
                              }),
                        );
                      },
                      child: Image(
                        image: AssetImage('assets/home_Screen_Student/Group 33636.png'),
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
                            )
                        ),

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
                                image: AssetImage('assets/Your Hostel Companion.png'),
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
                Spacer(),

               // Text((DateTime.now().day).toString() + (DateTime.now().).toString()),

                SizedBox(height: 20),
                Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text('Hello, '+ userModel.username,
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
                    padding: const EdgeInsets.fromLTRB(15,0,0,0),
                    child: Text("Let's manage your Hostel Things",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15,0,0,0),
                    child: Text('Quick Access',
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
                    borderRadius: BorderRadius.circular(10.0)
                  ),

                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: MaterialButton(
                      color: Color(0xff51E71D),
                      focusElevation: 0,
                      autofocus: true,
                      minWidth: 100,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) {
                                return ViewComplaintsAdmin();
                              }
                          ),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/home_Screen_Student/2720490 1.png'),
                          ),
                          SizedBox(width: 30,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('View',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              Text('Complaints',
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
                Spacer(),

                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0)
                  ),

                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: MaterialButton(
                      color: Color(0xffFFBCF4),
                      focusElevation: 0,
                      autofocus: true,
                      minWidth: 100,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) {
                                return EntryListAdmin();
                              }
                          ),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text('Entry/Exit',
                                style: TextStyle(
                                  color: Color(0xff743C7D),
                                  fontSize: 15,
                                ),
                              ),
                                Text('Reports',
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
                            image: AssetImage('assets/home_Screen_Student/sign-in-4 1.png',),
                          ),
                          Spacer(),

                        ],
                      ),
                    ),
                  ),

                ),
                Spacer(),
                Container(
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
                          color:Color(0xffF989E7),
                        ),
                      ),
                      Spacer(),
                      //SizedBox(width: 10),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) {
                                  return EntryListAdmin();
                                }
                            ),
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
                            MaterialPageRoute(
                                builder: (context) {
                                  return Alerts();
                                }
                            ),
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
                            MaterialPageRoute(
                                builder: (context) {
                                  return EditProfileAdmin();
                                }
                            ),
                          );
                        },
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                )

                ],

            ),
          )
      ),
    );
  }
}
