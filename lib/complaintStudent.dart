import 'package:flutter/material.dart';
import 'package:hostelite/home_screen_Student.dart';
import 'package:hostelite/shared_files/decoration.dart';

class StudentComplaint extends StatefulWidget {
  const StudentComplaint({Key key}) : super(key: key);

  @override
  _StudentComplaintState createState() => _StudentComplaintState();
}


Dialog leadDialog = Dialog(
  child: Container(
    height: 300,
    width: 360,
    child: Column(
      children: <Widget>[
        Center(
          child: Image(
            image: AssetImage('assets/create_account_page/Vector.png'),
            height: 150,
            width: 150,
          ),
        ),
        Text('Report Sent',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('Successfully',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        Container(
          width: 150.0,
          height: 40.0,
          child: MaterialButton(
            child: Text('Done',style: TextStyle(color: Colors.white,fontSize: 17.0),),
            color: Colors.pinkAccent[100],
            minWidth: 100.0,

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

            onPressed: () {
              BuildContext context;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context){
                        return HomeScreenStudent();
                      }
                  )
              );
            },
          ),
        ),
      ],
    ),
  ),
);


class _StudentComplaintState extends State<StudentComplaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          leading: BackButton(
            color: Colors.black87,
          ),
          title: Text('Report an Issue',
          style: TextStyle(
            color: Color(0xff4E4E4E),
          ),
          ),
          backgroundColor: Color(0xffFE96FA),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20,30,20,0),
              child: Column(
                children: <Widget>[
                  Card(
                    child: TextFormField(
                      decoration: textInputDecoration.copyWith(hintText: 'Room No.'),
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      decoration: textInputDecoration.copyWith(hintText: 'Your Issue'),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: Card(
                      child: TextField(
                        decoration: textInputDecoration.copyWith(hintText: 'Type Your Explanation...'),
                      ),
                      ),
                  ),
                  SizedBox(height: 20),
                  MaterialButton(
                    elevation: 30,
                    child: Text('Upload Image',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue[800],
                      backgroundColor: Colors.blue,
                    ),),
                      minWidth: 100,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {}

                      ),
                  MaterialButton(
                      child: Text('Send',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        backgroundColor: Colors.pinkAccent,
                      ),),
                      minWidth: 100,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () async {
                        showDialog(
                            context: context,
                            // ignore: non_constant_identifier_names
                            builder: (BuildContext) => leadDialog
                        );
                      }
                      )

                ],
              ),

            ),
          ),
        ),
      )
    );
  }
}
