import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/admin_screens/alerts_admin.dart';
import 'package:hostelite/admin_screens/exit-recordsAdmin.dart';
import 'package:hostelite/admin_screens/home_screen_Admin.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileAdmin extends StatefulWidget {
  const EditProfileAdmin({Key? key}) : super(key: key);

  @override
  _EditProfileAdminState createState() => _EditProfileAdminState();
}

firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;

firebase_storage.Reference ref = storage.ref().child('dps');

class _EditProfileAdminState extends State<EditProfileAdmin> {
  var imageUrl = 'str';
  late File _pickedImage;
  bool isLoading = false;

  var picsdb = FirebaseFirestore.instance
      .collection('displayPics')
      .doc(FirebaseAuth.instance.currentUser!.uid);
  String imgUrl = "";

  late File img;
  getImage() async {
    ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        img = File(image.path);
      });
    }
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  final TextEditingController username = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  Future buildUpdateProfile() async {
    FirebaseFirestore.instance
        .collection("adminUsers")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "username": username.text,
      "mobileNumber": mobileNumber.text,
      "emailAddress": email.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 40.h),
                child: Column(children: [
                  Row(children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Text('Edit Profile',
                        style: TextStyle(
                            fontSize: 28.sp,
                            color: Color(0xff747475),
                            fontWeight: FontWeight.w700)),
                  ]),
                  SizedBox(
                    height: 54.h,
                  ),
                  GestureDetector(
                    onTap: () async {
                      firebase_storage.UploadTask uploadedImg = ref
                          .child(
                              DateTime.now().microsecondsSinceEpoch.toString() +
                                  '.png')
                          .putFile(img);
                      await uploadedImg.whenComplete(() => null);

                      String url = "";

                      await ref.getDownloadURL().then((value) {
                        url = value;
                      });
                      db
                          .collection('dps')
                          .doc(_auth.currentUser!.uid)
                          .set({"dpUrl": url});
                    },
                    child: Container(
                      child: GestureDetector(
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
                            UploadTask task = reference.putFile(_pickedImage);
                            task.whenComplete(() {
                              reference.getDownloadURL().then((url) {
                                setState(() {
                                  imgUrl = url;
                                });
                                print(url);

                                picsdb.set({
                                  'dpUrl': url,
                                  'userUid':
                                      FirebaseAuth.instance.currentUser!.uid
                                });
                              });
                            });
                          });
                        },
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('displayPics')
                                .where("userUid",
                                    isEqualTo:
                                        FirebaseAuth.instance.currentUser!.uid)
                                .snapshots(),
                            builder: (context, snapshot) {
                              String? dataUrl;
                              if (snapshot.data != null) {
                                dataUrl = snapshot.data!.docs[0]["dpUrl"];
                              } else {
                                dataUrl = null;
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
                    ),
                  ),
                  SizedBox(
                    height: 64.h,
                  ),
                  TextFormField(
                    controller: username,
                    decoration: InputDecoration(
                      hintText: _auth.currentUser!.displayName,
                      labelText: 'Name',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.w)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:
                              BorderSide(color: Colors.cyan, width: 1.w)),
                    ),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: _auth.currentUser!.email,
                      labelText: 'Email',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.w)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:
                              BorderSide(color: Colors.cyan, width: 1.w)),
                    ),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  TextFormField(
                    controller: mobileNumber,
                    decoration: InputDecoration(
                      hintText: _auth.currentUser!.phoneNumber,
                      labelText: 'Mobile number',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.w)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:
                              BorderSide(color: Colors.cyan, width: 1.w)),
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
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w700),
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
                                    title: Text("Error updating profile"),
                                    content: Text("Please fill all fields"),
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
                                  builder: (context) => HomeScreenAdmin()));
                        }),
                  ),
                ]),
              ),
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
                      return HomeScreenAdmin();
                    }),
                  );
                },
                child: Icon(
                  Icons.home_filled,
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
                onPressed: () {},
                child: Icon(
                  Icons.person,
                  color: Color(0xffF989E7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
