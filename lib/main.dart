// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:hostelite/createAccountAdmin.dart';
import 'package:hostelite/createAccountStudent.dart';
import 'package:hostelite/entry-recordsAdmin.dart';
import 'package:hostelite/exit_entryStudent.dart';
import 'package:hostelite/home_screen_Admin.dart';
import 'package:hostelite/home_screen_Student.dart';
import 'package:hostelite/loginAdmin.dart';
import 'package:hostelite/loginStudent.dart';
import 'package:hostelite/mark_exit.dart';
import 'package:hostelite/starting_pages/fast_and_easy.dart';
import 'package:hostelite/starting_pages/home.dart';
import 'package:hostelite/starting_pages/keep_track.dart';
import 'package:hostelite/starting_pages/solve_your_issues.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
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

