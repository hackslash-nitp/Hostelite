import 'package:flutter/material.dart';
import 'package:hostelite/starting_pages/keep_track.dart';

class FastAndEasy extends StatefulWidget {
  const FastAndEasy({Key key}) : super(key: key);

  @override
  _FastAndEasyState createState() => _FastAndEasyState();
}

class _FastAndEasyState extends State<FastAndEasy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 40, 50, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                    autofocus: true,
                    splashColor: Colors.deepPurpleAccent,
                    onPressed: () {},
                    child: TextButton(
                      child: Text('Skip',
                        textAlign: TextAlign.end,
                        softWrap: true,
                      ),
                    )


                )
              ],
            ),
            SizedBox(height: 60),
            Center(
              child: Image(
                image: AssetImage('assets/third_page/undraw_fast_loading_0lbh 2.png'),
                width: 250,
                height: 250,
              )
            ),
            SizedBox(height: 0),
            Center(
              child: Image(
                image: AssetImage('assets/third_page/Fast & Easy!.png'),
                width: 300,
                height: 80,
              ),
            ),
            SizedBox(height: 0),
            Center(
              child: Image(
                image: AssetImage('assets/third_page/Now you can mark your entry and exit in just a tap..png'),
                width: 300,
                height: 50,
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Image(
                image: AssetImage('assets/third_page/Group 33656.png'),
                width: 50,
                height: 10,
              ),
            ),
            SizedBox(height: 60),
            Center(
              child:
              FlatButton(
                splashColor: Colors.deepPurpleAccent,
                focusColor: Colors.cyanAccent,
                highlightColor: Colors.amberAccent,
                child: Image(
                  image: AssetImage('assets/Group 33653.png'),
                  width: 50,
                  height: 50,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return KeepTrack();
                      }),
                  );
                },
              ),

            ),
          ]
        ),
      ),
    );
  }
}
