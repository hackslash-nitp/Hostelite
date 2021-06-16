import 'package:flutter/material.dart';

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
        padding: EdgeInsets.fromLTRB(50, 40, 50, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
            Center(
              child: Image(
                image: AssetImage('assets/fourth_page/undraw_Account_re_o7id 1.png'),
                width: 300,
                height: 300,
              ),
            ),
            SizedBox(height: 0),
            Center(
              child: Image(
                image: AssetImage('assets/fourth_page/Keep Track!.png'),
                width: 300,
                height: 80,
              ),
            ),
            Center(
              child: Image(
                image: AssetImage('assets/fourth_page/Now keep track of hostelites with our enhanced location tracker ..png'),
                width: 300,
                height: 50,
              ),
            ),
            SizedBox(height: 0),
            Center(
              child: Image(
                image: AssetImage('assets/fourth_page/Group 33657.png'),
                width: 50,
                height: 10,
              ),
            ),
            SizedBox(height: 80),
            Center(
              // ignore: deprecated_member_use
              child: FlatButton(
                splashColor: Colors.deepPurpleAccent,
                focusColor: Colors.cyanAccent,
                highlightColor: Colors.amberAccent,
                child: Image(
                  image: AssetImage('assets/fourth_page/get_started/Rectangle 425.png'),
                  width: 130,
                  height: 70,

                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),

    );
  }
}
