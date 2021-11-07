import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hostelite/createAccountAdmin.dart';
import 'package:hostelite/loading.dart';
import 'package:hostelite/main.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/createAccountStudent.dart';
import 'package:hostelite/home_screen_Admin.dart';
// import 'package:hostelite/firebase/register_sign_in.dart';
import 'package:hostelite/home_screen_Student.dart';
import 'package:hostelite/shared_files/decoration.dart';
import 'package:hostelite/loginStudent.dart';
import 'package:hostelite/starting_pages/home.dart';




class LoginAdmin extends StatefulWidget {
  const LoginAdmin({Key key}) : super(key: key);

  @override
  _LoginAdminState createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {



  String _email,_password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(

          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30,80,30,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/H_of_Hostelite.jpg'),
                            width: 80,
                            height: 80,
                          ),
                          Image(
                            image: AssetImage('assets/ostellite.png'),
                            width: 160,
                            height: 80,
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
                          width: 100,
                          height: 20,
                        ),
                        SizedBox(width: 5),
                        Image(
                          image: AssetImage('assets/Your Hostel Companion.png'),
                          width: 130,
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 80),
                  Text(
                    'SIGN IN',
                    style: TextStyle(color: Colors.black87, fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text('Get your home here!',
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
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
                      suffixIcon: const Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.cyan,
                              width: 1.0
                          )
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: '**************',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(

                              color: Colors.grey,
                              width: 1.0
                          )
                      ),
                      suffixIcon: const Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.cyan,
                              width: 1.0
                          )
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[



                      // Checkbox(checkColor: Colors.lightGreenAccent),

                      TextButton(
                        child: Text('Forgot Password?',
                          style: TextStyle(color: Colors.orange[700],fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          resetPassword(_email);
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 130,
                    height: 50,
                    child: MaterialButton(
                      child: Text('Login',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      color: Colors.purple,
                      minWidth: 100,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () async {
                        await  _auth.signInWithEmailAndPassword(email: _email, password: _password)
                            .then(( user) {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreenAdmin() ));


                        })
                            .catchError((err) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Error logging in"),
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
                  SizedBox(height: 10,),
                  Text('Or',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 190,
                    height: 50,
                    child: MaterialButton(
                      child: Text('Sign-In as Student',
                        style: TextStyle(color: Colors.purple, fontSize: 15),
                      ),
                      color: Colors.white,
                      minWidth: 100,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) {
                                  return LoginStudent();
                                }
                            )
                        );
                      },

                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("  Don't have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      TextButton(
                        child: Text('Create one',
                          style: TextStyle(color: Colors.orange[700], fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) {
                                  return CreateAccountAdmin();
                                }),
                          );
                        },



                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
