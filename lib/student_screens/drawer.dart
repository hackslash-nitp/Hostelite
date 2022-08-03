import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/student_screens/edit_profile_Student.dart';
import 'package:hostelite/student_screens/loginStudent.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFFFFBCF4),
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 40.h),
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFFFFBCF4),
                ),
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('displayPics')
                        .where("userUid",
                            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      String? dataUrl;
                      if (snapshot.data != null &&
                          !snapshot.data!.docs.isEmpty &&
                          !snapshot.hasError) {
                        dataUrl = snapshot.data!.docs[0]["dpUrl"];
                      } else {
                        dataUrl = null;
                      }
                      return CircleAvatar(
                        radius: 140.r,
                        backgroundColor: Color(0xFFFFBCF4),
                        backgroundImage: (dataUrl != null
                                ? NetworkImage(dataUrl)
                                : AssetImage('assets/nodppic.jfif'))
                            as ImageProvider<Object>?,
                      );
                    }),
              ),
              ColoredBox(
                color: Color(0xFFFFBCF4),
              ),
              ListTile(
                title: Text(
                  _auth.currentUser!.displayName!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF636363),
                  ),
                ),
                tileColor: Color(0xFFFFBCF4),
              ),
              ColoredBox(
                color: Color(0xFFFFBCF4),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Divider(
                    thickness: 1.w,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                  tileColor: Color(0xFFFFBCF4),
                  leading: Icon(Icons.edit),
                  title: Text(
                    'Edit Profile',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF641F65)),
                  ),
                  onTap: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return EditProfileStudent();
                        }))
                      }),
              ListTile(
                tileColor: Color(0xFFFFBCF4),
                leading: Icon(Icons.report_problem),
                title: Text(
                  'Report Issue',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF641F65),
                  ),
                ),
                onTap: () => {},
              ),
              ListTile(
                tileColor: Color(0xFFFFBCF4),
                leading: Icon(Icons.contact_support),
                title: Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF641F65),
                  ),
                ),
                onTap: () => {},
              ),
              ListTile(
                tileColor: Color(0xFFFFBCF4),
                leading: Icon(Icons.logout),
                title: Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF641F65),
                  ),
                ),
                onTap: () async {
                  _auth.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginStudent()));
                },
              ),
              SizedBox(
                height: 100.h,
                child: ColoredBox(
                  color: Color(0xFFFFBCF4),
                ),
              ),
              ListTile(
                title: Text(
                  'App Version 1.0',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF544D4D)),
                ),
                tileColor: Color(0xFFFFBCF4),
              ),
            ],
          ),
        ),
      ),
      designSize: const Size(280, 896),
    );
  }
}
