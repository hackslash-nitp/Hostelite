import 'package:flutter/material.dart';
import 'package:hostelite/createAccountStudent.dart';
import 'package:hostelite/shared_files/decoration.dart';

class LoginStudent extends StatefulWidget {
  const LoginStudent({Key key}) : super(key: key);

  @override
  _LoginStudentState createState() => _LoginStudentState();
}

class _LoginStudentState extends State<LoginStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                  hintText: 'Email Id',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey,
                          width: 3.0
                      )
                  ),
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.cyan,
                          width: 3.0
                      )
                  ),
                ),
                ),
            SizedBox(height: 10),
            TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password',prefixIcon: const Icon(Icons.lock, color: Colors.grey)),
            ),
            Row(
              children: <Widget>[
                Text('Remember me',
                style: TextStyle(color: Colors.black,fontSize: 10, fontWeight: FontWeight.bold),
                ),
               // Checkbox(checkColor: Colors.lightGreenAccent),
                SizedBox(width: 100),
                TextButton(
                  child: Text('Forgot Password?',
                    style: TextStyle(color: Colors.orange[700],fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                )
              ],
            ),
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
                onPressed: () {},

              ),
            ),
            Text('Or',
            style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            Container(
              width: 190,
              height: 50,
              child: MaterialButton(
                child: Text('Sign-In as Admin',
                style: TextStyle(color: Colors.purple, fontSize: 15),
                ),
                color: Colors.white,
                minWidth: 100,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                onPressed: () {},

              ),
            ),
            SizedBox(height: 20),
            Row(
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
                             return CreateAccountStudent();
                              }),
                          );
                      },



                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
