import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/home_screen_Admin.dart';
// import 'package:hostelite/models/user_model.dart';

class EditProfileAdmin extends StatefulWidget {
  const EditProfileAdmin({Key key}) : super(key: key);

  @override
  _EditProfileAdminState createState() => _EditProfileAdminState();
}

class _EditProfileAdminState extends State<EditProfileAdmin> {

FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController username = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  Future buildUpdateProfile() async {
    FirebaseFirestore.instance
        .collection("adminUsers")
        .doc(FirebaseAuth.instance.currentUser.uid)
    .collection("profile")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({
      "username" : username.text,
      "mobileNumber" : mobileNumber.text,
      "emailAddress" : email.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
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

                    hintText: _auth.currentUser.displayName,
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
                    hintText: _auth.currentUser.email,
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
                    hintText: _auth.currentUser.displayName,
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
                      buildUpdateProfile();
                      var message;
                      User firebaseUser = FirebaseAuth.instance
                          .currentUser;
                      firebaseUser
                          .updateEmail(email.text)
                          .then(
                            (value) => message = 'Success',
                      )
                          .catchError((onError) => message = 'error');
                      debugPrint(message);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreenAdmin() ));
                    },

                  ),
                ),

                


              ]),
            ),
          ),
        )
      ),
    );
  }
}
