import 'package:flutter/material.dart';
import 'package:hostelite/starting_pages/solve_your_issues.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 200, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/H_of_Hostelite.jpg'),
                    width: 100,
                    height: 100,
                  ),
                  Image(
                    image: AssetImage('assets/ostellite.png'),
                    width: 160,
                    height: 80,
                  ),
                ],
              )
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/Rectangle 368.png'),
                    width: 100,
                    height: 20,
                  ),
                  Image(
                    image: AssetImage('assets/Your Hostel Companion.png'),
                    width: 160,
                    height: 30,
                  ),
                ],
              ),
            ),
            SizedBox(height: 300),
            Center(
              child: FloatingActionButton(
                elevation: 10,
                backgroundColor: Colors.cyanAccent[600],
                autofocus: true,
                focusElevation: 05,
                splashColor: Colors.deepPurpleAccent,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SolveYourIssues();
                        }
                      ),
                  );
                },
              ),
            ),
        ],
        )
        ),
      );


  }
}
