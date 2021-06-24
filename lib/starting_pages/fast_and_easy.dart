import 'package:flutter/material.dart';
import 'package:hostelite/createAccountStudent.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:50.0,left:290.0),
            child: FlatButton(
              child: Text('Skip',
                textAlign: TextAlign.end,
                style: TextStyle(color: Colors.grey),
                softWrap: true,
              ),
              onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context){
                          return CreateAccountStudent();
                             }),
                            );


                       },

            ),

          ),
          SizedBox(height: 50),
          Center(
            child: Image(
              image: AssetImage('assets/third_page/undraw_fast_loading_0lbh 2.png'),
              width: 250,
              height: 250,
              fit: BoxFit.fill,
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
          SizedBox(height: 40),
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
            Padding(
              padding: const EdgeInsets.only(left:245.0),
              child: FlatButton(
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

          ),
        ]
      ),
    );
  }
}
