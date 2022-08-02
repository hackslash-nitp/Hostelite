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
import 'package:flutter_screenutil/flutter_screenutil.dart';

UserModel? userModel;

Future<void> saveTokenToDatabase(String? token) async {
  String userId = FirebaseAuth.instance.currentUser!.uid;

  await FirebaseFirestore.instance.collection("adminUsers").doc(userId).update({
    'tokens': FieldValue.arrayUnion([token]),
  });
}

class HomeScreenAdmin extends StatefulWidget {
  const HomeScreenAdmin({Key? key}) : super(key: key);

  @override
  _HomeScreenAdminState createState() => _HomeScreenAdminState();
}

class _HomeScreenAdminState extends State<HomeScreenAdmin> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  Future getCurrentUserDataFunction() async {
    await FirebaseFirestore.instance
        .collection("adminUsers")
        .doc(FirebaseAuth.instance.currentUser!.uid)
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
      .collection(FirebaseAuth.instance.currentUser!.uid)
      .get();

  void startTokenWork() async {
    String? token = await FirebaseMessaging.instance.getToken();
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
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) => WillPopScope(
        child: SafeArea(
          child: Scaffold(
            key: _scaffoldkey,
            drawer: NavDrawerAdmin(),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        MaterialButton(
                          height: 45.h,
                          minWidth: 30.w,
                          splashColor: Colors.pink,
                          onPressed: () {
                            _scaffoldkey.currentState!.openDrawer();
                          },
                          child: Image(
                            image: AssetImage(
                                'assets/home_Screen_Student/Group 33636.png'),
                            height: 45.h,
                            width: 45.w,
                          ),
                        ),
                        SizedBox(width: 30),
                        Image(
                          image: AssetImage("assets/Hostellite.png"),
                          width: 170.w,
                          height: 60.h,
                        )
                      ],
                    ),
                    SizedBox(height: 25.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'Hello, ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        "Let's manage your Hostel Things",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF858585),
                        ),
                      ),
                    ),
                    SizedBox(height: 47.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'Quick Access',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 47.h),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r)),
                      width: MediaQuery.of(context).size.width,
                      height: 180.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: MaterialButton(
                          color: Color(0xff51E71D),
                          focusElevation: 0,
                          autofocus: true,
                          minWidth: 100.w,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return PendingComplaints();
                              }),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Image(
                                image: AssetImage(
                                    'assets/home_Screen_Student/2720490 1.png'),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'View',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'Complaints',
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 68.h),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r)),
                      width: MediaQuery.of(context).size.width,
                      height: 180.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: MaterialButton(
                          color: Color(0xffFFBCF4),
                          focusElevation: 0,
                          autofocus: true,
                          minWidth: 100.w,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return ExitListAdmin();
                              }),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Entry/Exit',
                                    style: TextStyle(
                                        color: Color(0xff743C7D),
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'Reports',
                                    style: TextStyle(
                                      color: Color(0xff743C7D),
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Image(
                                image: AssetImage(
                                  'assets/home_Screen_Student/sign-in-4 1.png',
                                ),
                                height: 119.h,
                                width: 170.w,
                              ),
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
                borderRadius: BorderRadius.circular(35.r),
                border: Border.all(
                  color: Colors.grey[300]!,
                ),
              ),
              height: 84.h,
              width: 414.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.home_filled,
                      color: Color(0xffF989E7),
                    ),
                  ),
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
                ],
              ),
            ),
          ),
        ),
        onWillPop: (() => showDialog<bool>(
              context: context,
              builder: (c) => AlertDialog(
                title: Text('Warning'),
                content: Text('Do you really want to exit?'),
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
            ).then((value) => value!)),
      ),
    );
  }
}
