import 'package:flutter/material.dart';
import 'package:hostelite/starting_pages/fast_and_easy.dart';


class SolveYourIssues extends StatefulWidget {
  const SolveYourIssues({Key key}) : super(key: key);

  @override
  _SolveYourIssuesState createState() => _SolveYourIssuesState();
}

class _SolveYourIssuesState extends State<SolveYourIssues> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: EdgeInsets.fromLTRB(60, 40 , 60, 10),
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
            SizedBox(height: 50),
            Center(
              child: Image(
                image: AssetImage('assets/second_page/Group 33694.png'),
                width: 250,
                height: 250,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Image(
                image: AssetImage('assets/second_page/Solve your Issues.png'),
                width: 300,
                height: 80,
              ),
            ),
            SizedBox(height: 0),
            Center(
              child: Image(
                image: AssetImage('assets/second_page/Contact to authorities whenever you have any complaints..png'),
                width: 300,
                height: 50,
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Image(
                image: AssetImage('assets/second_page/Group 33655.png'),
                width: 50,
                height: 10,
              ),
            ),
            SizedBox(height: 60),
            Center(
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
                      builder: (context){
                        return FastAndEasy();
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
