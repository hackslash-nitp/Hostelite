import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelite/admin_screens/createAccountAdmin.dart';
import 'package:hostelite/starting_pages/onboarding.dart';
import 'package:hostelite/student_screens/createAccountStudent.dart';
import 'package:hostelite/student_screens/exit_entryStudent.dart';
import 'package:hostelite/admin_screens/home_screen_Admin.dart';
import 'package:hostelite/student_screens/home_screen_Student.dart';
import 'package:hostelite/admin_screens/loginAdmin.dart';
import 'package:hostelite/student_screens/loginStudent.dart';
import 'package:hostelite/student_screens/mark_exit.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  // var isLoggedIn = (prefs.getBool('isLoggedIn') == null)
  //     ? false
  //     : prefs.getBool('isLoggedIn');

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      // '/': (context) => HomeScreenStudent(),
      '/boardingpage': (context) => BoardingPage(),
      '/createaccountstudent': (context) => CreateAccountStudent(),
      '/createaccountadmin': (context) => CreateAccountAdmin(),
      '/loginstudent': (context) => LoginStudent(),
      '/loginadmin': (context) => LoginAdmin(),
      '/homescreenstudent': (context) => HomeScreenStudent(),
      '/homescreenadmin': (context) => HomeScreenAdmin(),
      '/studententry': (context) => MarkingEntry(),
      '/studentexit': (context) => MarkingExit(),
    },
    home: InitialScreenDecider(),
  ));
}

class InitialScreenDecider extends StatelessWidget {
  const InitialScreenDecider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //     future: SharedPreferences.getInstance(),
    //     builder:
    //         (BuildContext context, AsyncSnapshot<SharedPreferences> prefs) {
    //       var x = prefs.data;
    //       print(x);
    //       if (prefs.hasData) {
    //         if (x.getBool('isloggedin')) {
    //           if (x.getString('type') == 'admin') {
    //             return MaterialApp(home: HomeScreenAdmin());
    //           } else
    //             return MaterialApp(home: HomeScreenStudent());
    //         }
    //       }
    //       return MaterialApp(home: LoginAdmin());
    //     });
    return (FirebaseAuth.instance.currentUser != null)
        ? HomeScreenStudent()
        : BoardingPage();
  }
}
