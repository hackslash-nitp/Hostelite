import 'package:flutter/material.dart';
import 'package:hostelite/student_screens/createAccountStudent.dart';
import 'package:hostelite/student_screens/loginStudent.dart';

class KeepTrack extends StatefulWidget {
  const KeepTrack({Key key}) : super(key: key);

  @override
  _KeepTrackState createState() => _KeepTrackState();
}

class _KeepTrackState extends State<KeepTrack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(
                    'assets/fourth_page/undraw_Account_re_o7id 1.png'),
                width: 300,
                height: 300,
              ),
              Image(
                image: AssetImage('assets/fourth_page/Keep Track!.png'),
                width: 300,
                height: 80,
              ),
              Image(
                image: AssetImage(
                    'assets/fourth_page/Now keep track of hostelites with our enhanced location tracker ..png'),
                width: 300,
                height: 50,
              ),
              SizedBox(height: 70),
              Image(
                image: AssetImage('assets/fourth_page/Group 33657.png'),
                width: 50,
                height: 10,
              ),
              SizedBox(height: 80),
              Container(
                width: 150.0,
                height: 40.0,
                child: MaterialButton(
                  child: Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white, fontSize: 17.0),
                  ),
                  color: Colors.purple,
                  minWidth: 100.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginStudent();
                    }));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
