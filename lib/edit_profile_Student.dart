import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/home_screen_Student.dart';

class EditProfileStudent extends StatefulWidget {
  const EditProfileStudent({Key key}) : super(key: key);

  @override
  _EditProfileStudentState createState() => _EditProfileStudentState();
}

class _EditProfileStudentState extends State<EditProfileStudent> {

  final TextEditingController username = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  // Future buildUpdateProfile() async {
  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(FirebaseAuth.instance.currentUser.uid)
  //       .update({
  //     "username" : username.text,
  //     "mobileNumber" : mobileNumber.text,
  //     "emailAddress" : email.text,
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 50, 15, 15),
              child: Column(children: [
                Row(children: [IconButton(
                  icon: Icon( Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),),
                  SizedBox(width: 50,),
                  Text(
                      'Edit Profile',
                      style:TextStyle(
                          fontSize: 24,
                          color: Color(0xff747475)
                      )
                  ),



                ]
                ),
                SizedBox(height: 35,),
                CircleAvatar(
                  radius: 85,
                  backgroundColor: Colors.orange[100],
                ),
                SizedBox(height: 35,),
                TextFormField(
                  controller: username,
                  decoration: InputDecoration(

                    hintText: 'username',
                    labelText: 'Name',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(

                            color: Colors.grey,
                            width: 1.0
                        )
                    ),

                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.cyan,
                            width: 1.0
                        )
                    ),
                  ),
                ),
                SizedBox(height: 28,),

                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: 'username',
                    labelText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(

                            color: Colors.grey,
                            width: 1.0
                        )
                    ),

                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.cyan,
                            width: 1.0
                        )
                    ),
                  ),
                ),

                SizedBox(height: 28,),

                TextFormField(
                  controller: mobileNumber,
                  decoration: InputDecoration(
                    hintText: 'username',
                    labelText: 'Mobile number',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(

                            color: Colors.grey,
                            width: 1.0
                        )
                    ),

                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.cyan,
                            width: 1.0
                        )
                    ),
                  ),
                ),
                SizedBox(height:50),

                Container(
                  width: 130,
                  height: 50,
                  child: MaterialButton(
                    child: Text('Save',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    color: Colors.purple,
                    minWidth: 100,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {
                      // buildUpdateProfile();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreenStudent() ));
                    },

                  ),
                ),




              ]),
            ),
          ),
        )
    );
  }
}
