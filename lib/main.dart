import 'package:flutter/material.dart';
import 'package:hostelite/createAccountStudent.dart';
import 'package:hostelite/loginStudent.dart';
import 'package:hostelite/starting_pages/fast_and_easy.dart';
import 'package:hostelite/starting_pages/home.dart';
import 'package:hostelite/starting_pages/keep_track.dart';
import 'package:hostelite/starting_pages/solve_your_issues.dart';



void main() => runApp(MaterialApp(
  initialRoute: '/home',

  routes: {
    '/': (context) => Home(),
    '/solveyourissues': (context) => SolveYourIssues(),
    '/fastandeasy': (context) => FastAndEasy(),
    '/keeptrack': (context) => KeepTrack(),
    '/createaccountstudent': (context) => CreateAccountStudent(),
    '/loginstudent' : (context) => LoginStudent(),
  },
));

