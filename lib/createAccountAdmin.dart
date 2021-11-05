
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/loginAdmin.dart';
import 'package:hostelite/shared_files/decoration.dart';


class CreateAccountAdmin extends StatefulWidget {
  const CreateAccountAdmin({Key key}) : super(key: key);

  @override
  _CreateAccountAdminState createState() => _CreateAccountAdminState();
}

Dialog leadDialog = Dialog(
  child: Container(
    height: 300,
    width: 360,
    child: Column(
      children: <Widget>[
        Center(
          child: Image(
            image: AssetImage('assets/create_account_page/Vector.png'),
            height: 150,
            width: 150,
          ),
        ),
        Text('Registered',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('Successfully',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        Container(
          width: 150.0,
          height: 40.0,
          child: RaisedButton(
            child: Text('Done',style: TextStyle(color: Colors.white,fontSize: 17.0),),
            color: Colors.pinkAccent[100],     // minWidth: 100.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            onPressed: () {

              BuildContext context;
              Navigator.push(context,MaterialPageRoute(builder: (context) => LoginAdmin()));
            },
          ),
        ),
      ],
    ),
  ),
);

class _CreateAccountAdminState extends State<CreateAccountAdmin> {

  UserCredential userCredential;


  final _formKey = GlobalKey<FormState>();
  String username;
  String email;
  String mobileNumber;
  String confirmPassword;
   String password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30,60,30,0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.fromLTRB(0,10,10,10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Create Account',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      SizedBox(height: 0),
                      Text('Get your home here!',
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 45,
                  width: 280,
                  child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Username',
                        prefixIcon: const Icon(Icons.person, color: Colors.grey)),
                      onChanged: (value) {
                        setState(() {
                          username = value.trim();
                        });
                      }
                  ),
                ),


                SizedBox(height: 15),
                Container(
                  height: 45,
                  width: 280,
                  child: TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'E-Mail',
                        prefixIcon: const Icon(
                            Icons.email, color: Colors.grey)
                    ),
                    onChanged: (value) {
                      setState(() {
                        email = value.trim();
                      });
                    },
                  ),
                ),



                SizedBox(height: 15),
                Container(
                  height: 45,
                  width: 280,
                  child: TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Mobile No.',
                        prefixIcon: const Icon(Icons.local_phone, color: Colors.grey)),
                      onChanged: (value) {
                        setState(() {
                       mobileNumber = value.trim();
                        });
                      }
                  ),
                ),

                SizedBox(height: 15),
                Container(
                  height: 45,
                  width: 280,
                  child: TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Create Password',
                        prefixIcon: const Icon(
                            Icons.lock, color: Colors.grey)
                    ),
                    onChanged: (value) {
                      setState(() {
                        password = value.trim();
                      });
                    },
                  ),

                ),

                SizedBox(height: 15),
                Container(
                  height: 45,
                  width: 280,
                  child: TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Confirm Password',
                        prefixIcon: const Icon(Icons.lock, color: Colors.grey)),
                      onChanged: (value) {
                        setState(() {
                       confirmPassword = value.trim();
                        });
                      }
                  ),
                ),
                SizedBox(height: 40),
                SingleChildScrollView(
                  child: Container(
                    height: 40,
                    width: 150,
                    child: MaterialButton(
                      child: Text('Register',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      color: Colors.purple,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () async {
                        // if (username.isEmpty || email.isEmpty ||
                        //     password.isEmpty || confirmPassword.isEmpty || mobileNumber.isEmpty){
                        //   showDialog(
                        //       context: context,
                        //       builder: (BuildContext context) {
                        //         return AlertDialog(
                        //           title: Text("Error signing up"),
                        //           content: Text("Please fill all the fields"),
                        //           actions: [
                        //             FlatButton(
                        //               child: Text("Ok"),
                        //               onPressed: () {
                        //                 Navigator.of(context).pop();
                        //               },
                        //             )
                        //           ],
                        //         );
                        //       });
                        //
                        // }
                        if (password != confirmPassword){
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Error signing up"),
                                  content: Text("Passwords don't match"),
                                  actions: [
                                    FlatButton(
                                      child: Text("Ok"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              });
                          return;
                        }
                       userCredential = await  _auth.createUserWithEmailAndPassword(email: email, password: password)
                           .then((user) {
                         //Sending user data
                         FirebaseFirestore.instance.
                         collection("adminUsers").
                         doc(FirebaseAuth.instance.currentUser.uid).collection("profile").
                         doc(FirebaseAuth.instance.currentUser.uid)

                             .set({
                           "username" : username,
                           "mobileNumber" : mobileNumber,
                           "emailAddress" : email,
                           "userUid" : userCredential.user.uid


                         });

                         showDialog(
                             context: context,
                             // ignore: non_constant_identifier_names
                             builder: (BuildContext) => leadDialog);
                       }).catchError((err) {
                         showDialog(
                             context: context,
                             builder: (BuildContext context) {
                               return AlertDialog(
                                 title: Text("Error signing up"),
                                 content: Text(err.message),
                                 actions: [
                                   FlatButton(
                                     child: Text("Ok"),
                                     onPressed: () {
                                       Navigator.of(context).pop();
                                     },
                                   )
                                 ],
                               );
                             });
                       });


                      },

                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    Text('     Already have an Account ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black87),
                    ),
                    TextButton(child:
                    Text('Sign In',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red),
                    ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) {
                                return LoginAdmin();
                              }),
                        );
                      },
                    )
                  ],
                )




              ],
            ),
          ),
        ),
      ),
    );
  }
}
