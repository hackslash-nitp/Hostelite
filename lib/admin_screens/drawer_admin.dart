import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/admin_screens/alerts_admin.dart';
import 'package:hostelite/admin_screens/edit_profile_Admin.dart';
import 'package:hostelite/admin_screens/loginAdmin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavDrawerAdmin extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final db = FirebaseFirestore.instance
      .collection("adminUsers")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("profile")
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(290, 896),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFFFFBCF4),
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
                      if (snapshot.data != null) {
                        dataUrl = snapshot.data!.docs[0]["dpUrl"];
                      } else {
                        dataUrl = null;
                      }
                      return CircleAvatar(
                        radius: 134.r,
                        backgroundColor: Colors.grey,
                        backgroundImage: (dataUrl != null
                                ? NetworkImage(dataUrl)
                                : AssetImage('assets/nodppic.jfif'))
                            as ImageProvider<Object>?,
                      );
                    }),
              ),
              StreamBuilder<Object>(
                  stream: FirebaseFirestore.instance
                      .collection("adminUsers")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("profile")
                      .snapshots(),
                  builder: (context, snapshot) {
                    return ListTile(
                      title: Text(
                        _auth.currentUser!.displayName!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff636363),
                        ),
                      ),
                      tileColor: Color(0xFFFFBCF4),
                    );
                  }),
              ListTile(
                tileColor: Color(0xFFFFBCF4),
                title: Text(
                  'Hostel In-Charge',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.sp, color: Color(0xFF525252)),
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 1.w,
              ),
              ColoredBox(
                color: Color(0xFFFFBCF4),
              ),
              ListTile(
                tileColor: Color(0xFFFFBCF4),
                leading: Icon(Icons.edit),
                title: Text(
                  'Edit Profile',
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF605D60)),
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return EditProfileAdmin();
                    }),
                  )
                },
              ),
              ListTile(
                tileColor: Color(0xFFFFBCF4),
                leading: Icon(Icons.notifications),
                title: Text(
                  'Alerts',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      color: Color(0xFF605D60)),
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Alerts();
                    }),
                  )
                },
              ),
              ListTile(
                tileColor: Color(0xFFFFBCF4),
                leading: Icon(Icons.report_problem),
                title: Text(
                  'Report Issue',
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF605D60)),
                ),
                onTap: () => {},
              ),
              ListTile(
                tileColor: Color(0xFFFFBCF4),
                leading: Icon(Icons.quick_contacts_dialer_outlined),
                title: Text(
                  'Contact Us',
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF605D60)),
                ),
                onTap: () => {},
              ),
              ListTile(
                tileColor: Color(0xFFFFBCF4),
                leading: Icon(Icons.logout),
                title: Text(
                  'Log Out',
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF605D60)),
                ),
                onTap: () async {
                  _auth.signOut();
                  print('signed out');
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginAdmin()));
                },
                // onTap: () => {
                //   // print('signed out')
                //   _auth.signOut()
                //
                // },
              ),
              SizedBox(
                height: 50.h,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
