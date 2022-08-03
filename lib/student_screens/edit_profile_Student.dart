import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/student_screens/home_screen_Student.dart';
import 'package:hostelite/student_screens/studentexitrecords.dart';
import 'package:hostelite/student_screens/students_complaint_list.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileStudent extends StatefulWidget {
  const EditProfileStudent({Key? key}) : super(key: key);

  @override
  _EditProfileStudentState createState() => _EditProfileStudentState();
}

class _EditProfileStudentState extends State<EditProfileStudent> {
  late File _pickedImage;
  bool isLoading = false;

  var db = FirebaseFirestore.instance
      .collection('studentUsers')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('profile')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  FirebaseAuth? _auth = FirebaseAuth.instance;

  dynamic picsdb = FirebaseFirestore.instance
      .collection('displayPics')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  final TextEditingController username = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController rollNumber = TextEditingController();
  final TextEditingController roomNumber = TextEditingController();

  Future buildUpdateProfile() async {
    await FirebaseFirestore.instance
        .collection("studentUsers")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("profile")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "username": username.text,
      "mobileNumber": mobileNumber.text,
      "emailAddress": email.text,
      "roomNumber": roomNumber.text,
      "rollNumber": rollNumber.text
    });
  }

  String imgUrl = "";

  @override
  Widget build(BuildContext context) {
    return ((picsdb == null || _auth == null)
        ? CircularProgressIndicator
        : ScreenUtilInit(
            builder: ((context, child) => SafeArea(
                  child: Scaffold(
                    body: SingleChildScrollView(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 40.h),
                          child: Column(children: [
                            Row(children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                              Text(
                                'Edit Profile',
                                style: TextStyle(
                                    fontSize: 28.sp,
                                    color: Color(0xff747475),
                                    fontWeight: FontWeight.w700),
                              ),
                            ]),
                            SizedBox(
                              height: 40.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                ImagePicker()
                                    .pickImage(source: ImageSource.gallery)
                                    .then((value) async {
                                  _pickedImage = File(value!.path);
                                  Reference reference = FirebaseStorage.instance
                                      .ref()
                                      .child('images')
                                      .child('dps')
                                      .child(DateTime.now()
                                              .microsecondsSinceEpoch
                                              .toString() +
                                          '.jpg');
                                  UploadTask task =
                                      reference.putFile(_pickedImage);
                                  task.whenComplete(() {
                                    reference.getDownloadURL().then((url) {
                                      setState(() {
                                        imgUrl = url;
                                      });
                                      print(url);
                                      print(imgUrl);
                                      picsdb.set({
                                        'dpUrl': url,
                                        'userUid': FirebaseAuth
                                            .instance.currentUser!.uid
                                      });
                                    });
                                  });
                                });
                              },
                              child: StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('displayPics')
                                      .where("userUid",
                                          isEqualTo: FirebaseAuth
                                              .instance.currentUser!.uid)
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    String? dataUrl;
                                    if (snapshot.data != null &&
                                        !snapshot.data!.docs.isEmpty &&
                                        !snapshot.hasError) {
                                      print(snapshot.data!.docs);
                                      dataUrl = snapshot.data!.docs[0]["dpUrl"];
                                    }

                                    return !snapshot.hasData
                                        ? CircularProgressIndicator()
                                        : CircleAvatar(
                                            radius: 85.r,
                                            backgroundColor: Colors.grey,
                                            backgroundImage: (dataUrl != null
                                                    ? NetworkImage(dataUrl)
                                                    : AssetImage(
                                                        'assets/nodppic.jfif'))
                                                as ImageProvider<Object>?,
                                          );
                                  }),
                            ),
                            SizedBox(
                              height: 35.h,
                            ),
                            TextFormField(
                              controller: username,
                              decoration: InputDecoration(
                                hintText: _auth!.currentUser!.displayName,
                                labelText: 'Name',
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.w)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: BorderSide(
                                        color: Colors.cyan, width: 1.w)),
                              ),
                            ),
                            SizedBox(
                              height: 28.h,
                            ),
                            TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                hintText: _auth!.currentUser!.email,
                                labelText: 'Email',
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.w)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: BorderSide(
                                        color: Colors.cyan, width: 1.w)),
                              ),
                            ),
                            SizedBox(
                              height: 28.h,
                            ),
                            TextFormField(
                              controller: mobileNumber,
                              decoration: InputDecoration(
                                hintText: _auth!.currentUser!.phoneNumber,
                                labelText: 'Mobile number',
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.w)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: BorderSide(
                                        color: Colors.cyan, width: 1.w)),
                              ),
                            ),
                            SizedBox(
                              height: 28.h,
                            ),
                            TextFormField(
                              controller: roomNumber,
                              decoration: InputDecoration(
                                hintText: 'room no.',
                                labelText: 'Room number',
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.w)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: BorderSide(
                                        color: Colors.cyan, width: 1.w)),
                              ),
                            ),
                            SizedBox(
                              height: 28.h,
                            ),
                            TextFormField(
                              controller: rollNumber,
                              decoration: InputDecoration(
                                hintText: 'roll no.',
                                labelText: 'Roll number',
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.w)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: BorderSide(
                                        color: Colors.cyan, width: 1.w)),
                              ),
                            ),
                            SizedBox(height: 50.h),
                            Container(
                              width: 146.w,
                              height: 53.h,
                              child: MaterialButton(
                                child: isLoading
                                    ? CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 3.w,
                                      )
                                    : Text(
                                        'Save',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.sp),
                                      ),
                                color: Color(0xFFCA48D6),
                                minWidth: 100.w,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.r)),
                                onPressed: () async {
                                  if (isLoading) return;
                                  setState(() {
                                    isLoading = true;
                                  });
                                  if (username.text.isEmpty ||
                                      email.text.isEmpty ||
                                      mobileNumber.text.isEmpty) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title:
                                                Text("Error updating profile"),
                                            content:
                                                Text("Please fill all fields"),
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
                                    return;
                                  }
                                  buildUpdateProfile();

                                  //code to update email in firebase auth

                                  User firebaseUser =
                                      FirebaseAuth.instance.currentUser!;
                                  firebaseUser.updateDisplayName(username.text);
                                  await firebaseUser.updateEmail(email.text);

                                  setState(() {
                                    isLoading = false;
                                  });
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreenStudent()));
                                },
                              ),
                            ),
                          ]),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return HomeScreenStudent();
                                }),
                              );
                            },
                            child: Icon(
                              Icons.home_filled,
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          StudentExitRecordList()));
                            },
                            child: Icon(
                              Icons.add_chart_outlined,
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return StudentComplaintList();
                                }),
                              );
                            },
                            child: Icon(
                              Icons.av_timer_outlined,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return EditProfileStudent();
                                }),
                              );
                            },
                            icon: Icon(
                              Icons.person,
                              color: Color(0xffF989E7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            designSize: const Size(414, 896),
          )) as Widget;
  }
}
