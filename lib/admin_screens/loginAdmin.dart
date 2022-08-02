import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hostelite/admin_screens/createAccountAdmin.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/admin_screens/home_screen_Admin.dart';
import 'package:hostelite/student_screens/loginStudent.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({Key? key}) : super(key: key);

  @override
  _LoginAdminState createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  String? _email, _password;
  bool isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance.collection('adminUsers');

  Future<void> resetPassword(String? email) async {
    if (email == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please enter the email-id")));
      return;
    }
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        builder: ((context, child) => Scaffold(
              body: SafeArea(
                child: Container(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 50.w, vertical: 30.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage("assets/Hostellite.png"),
                            width: 286.w,
                            height: 128.h,
                          ),
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
                          SizedBox(height: 54.h),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.w)),
                              suffixIcon: const Icon(
                                Icons.email_outlined,
                                color: Colors.grey,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide(
                                      color: Colors.cyan, width: 1.w)),
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
                                      color: Colors.grey, width: 1.w)),
                              suffixIcon: const Icon(
                                Icons.lock,
                                color: Colors.grey,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide(
                                      color: Colors.cyan, width: 1.w)),
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
                            height: 20.h,
                          ),
                          Container(
                            width: 183.w,
                            height: 54.h,
                            child: MaterialButton(
                              child: isLoading
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3.w,
                                    )
                                  : Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18.sp),
                                    ),
                              color: Color(0xFF9C32A6),
                              minWidth: 100.w,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r)),
                              onPressed: () async {
                                if (isLoading) return;
                                setState(() {
                                  isLoading = true;
                                });
                                try {
                                  await _auth.signInWithEmailAndPassword(
                                      email: _email!, password: _password!);

                                  var uid = _auth.currentUser!.uid;
                                  print("-----------------1");
                                  db.doc(uid).get().then((value) => {
                                        if (value.exists)
                                          {
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                                return HomeScreenAdmin();
                                              }),
                                              (route) => false,
                                            )
                                          }
                                        else
                                          {print(value.data())}
                                      });
                                } catch (e) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Error logging in"),
                                          content: Text(
                                              "Incorrect email or password!"),
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
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Or',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width: 230.w,
                            height: 47.h,
                            child: MaterialButton(
                              child: Text(
                                'Sign-In as Student',
                                style: TextStyle(
                                    color: Color(0xFF51025E), fontSize: 20.sp),
                              ),
                              color: Colors.white,
                              minWidth: 100.w,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r)),
                              onPressed: () async {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LoginStudent();
                                }));
                              },
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "  Don't have an account?",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                              TextButton(
                                child: Text(
                                  'Create one',
                                  style: TextStyle(
                                      color: Color(0xFFF76306),
                                      fontWeight: FontWeight.w500),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
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
            )));
  }
}
