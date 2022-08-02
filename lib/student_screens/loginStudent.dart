import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/student_screens/createAccountStudent.dart';
//import 'package:hostelite/firebase/register_sign_in.dart';
import 'package:hostelite/admin_screens/loginAdmin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginStudent extends StatefulWidget {
  const LoginStudent({Key? key}) : super(key: key);

  @override
  _LoginStudentState createState() => _LoginStudentState();
}

class _LoginStudentState extends State<LoginStudent> {
  String? _email, _password;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance.collection('studentUsers');
  bool isLoading = false;

  Future<void> resetPassword(String? email) async {
    if (_email == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Enter email-id")),
      );
      return;
    }
    await _auth.sendPasswordResetEmail(email: email!);
  }

  Future<void> loginUser() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _email!, password: _password!);

      var uid = _auth.currentUser!.uid;
      // db.doc(uid).get().then((value) => {
      //       if (value.exists)
      //         {
      Navigator.of(context).pushNamed('/homescreenstudent');
      //     }
      // });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error logging in"),
              content: Text("Incorrect email or password!"),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: ((context, child) => Scaffold(
            body: SafeArea(
              child: Container(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(
                            child: Image(
                          image: AssetImage('assets/Hostellite.png'),
                          height: 129.h,
                          width: 286.w,
                        )),
                        SizedBox(height: 100.h),
                        Text(
                          'SIGN IN',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Get your home here!',
                          style: TextStyle(
                              color: Color(0xFF6A6A6A), fontSize: 12.sp),
                        ),
                        SizedBox(height: 42.h),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@'))
                              return 'Please enter a valid Email address';
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide: BorderSide(
                                    color: Color(0xFF878787), width: 1.w)),
                            suffixIcon: const Icon(
                              Icons.email_outlined,
                              color: Colors.grey,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide:
                                    BorderSide(color: Colors.cyan, width: 1.w)),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _email = value.trim();
                            });
                          },
                        ),
                        SizedBox(height: 47.h),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: '**************',
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide: BorderSide(
                                    color: Color(0xFF878787), width: 1.w)),
                            suffixIcon: const Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide:
                                    BorderSide(color: Colors.cyan, width: 1.w)),
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
                            TextButton(
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    color: Color(0xFFF76306),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              onPressed: () {
                                resetPassword(_email);
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Container(
                          width: 183.w,
                          height: 54.h,
                          child: MaterialButton(
                            child: isLoading
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2.w,
                                  )
                                : Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                            color: Color(0xFF9C32A6),
                            minWidth: 100.w,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r)),
                            onPressed: () async {
                              if (isLoading) return;
                              setState(() {
                                isLoading = true;
                              });
                              await loginUser();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'Or',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          width: 230.w,
                          height: 47.h,
                          child: MaterialButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 29.w, vertical: 6.h),
                            child: Text(
                              'Sign-In as Admin',
                              style: TextStyle(
                                  color: Color(0xFF51025E),
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            color: Colors.white,
                            minWidth: 100,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r)),
                            onPressed: () async {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return LoginAdmin();
                              }));
                            },
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  color: Color(0xFF484848),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextButton(
                              child: Text(
                                'Create one',
                                style: TextStyle(
                                    color: Color(0xFFF76306),
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
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
                ),
              ),
            ),
          )),
      designSize: const Size(414, 896),
    );
  }
}
