import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/admin_screens/createAccountAdmin.dart';
import 'package:hostelite/student_screens/createAccountStudent.dart';
import 'package:hostelite/admin_screens/entry-recordsAdmin.dart';
import 'package:hostelite/student_screens/exit_entryStudent.dart';
import 'package:hostelite/admin_screens/home_screen_Admin.dart';
import 'package:hostelite/student_screens/home_screen_Student.dart';
import 'package:hostelite/admin_screens/loginAdmin.dart';
import 'package:hostelite/student_screens/loginStudent.dart';
import 'package:hostelite/student_screens/mark_exit.dart';
import 'package:hostelite/starting_pages/fast_and_easy.dart';
import 'package:hostelite/starting_pages/home.dart';
import 'package:hostelite/starting_pages/keep_track.dart';
import 'package:hostelite/starting_pages/solve_your_issues.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/loginadmin',
    routes: {
      '/': (context) => HomeScreenStudent(),
      '/solveyourissues': (context) => SolveYourIssues(),
      '/fastandeasy': (context) => FastAndEasy(),
      '/keeptrack': (context) => KeepTrack(),
      '/createaccountstudent': (context) => CreateAccountStudent(),
      '/createaccountadmin': (context) => CreateAccountAdmin(),
      '/loginstudent': (context) => LoginStudent(),
      '/loginadmin': (context) => LoginAdmin(),
      '/homescreenstudent': (context) => HomeScreenStudent(),
      '/homescreenadmin': (context) => HomeScreenAdmin(),
      '/studententry': (context) => MarkingEntry(),
      '/studentexit': (context) => MarkingExit(),
    },
  ));
}
