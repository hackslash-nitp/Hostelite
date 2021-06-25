
import 'package:flutter/material.dart';
import 'package:hostelite/loginStudent.dart';
import 'package:hostelite/shared_files/decoration.dart';


class CreateAccountStudent extends StatefulWidget {
  const CreateAccountStudent({Key key}) : super(key: key);

  @override
  _CreateAccountStudentState createState() => _CreateAccountStudentState();
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
        Text('Registered',
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
                        return LoginStudent();
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



class _CreateAccountStudentState extends State<CreateAccountStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30,60,30,0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.fromLTRB(0,10,10,10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Create Account',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(height: 0),
                  Text('Get your home here!',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 45,
              width: 280,
              child: TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Username', prefixIcon: const Icon(Icons.person, color: Colors.grey)),

              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 45,
              width: 280,
              child: TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Roll No.'),
              ),
            ),

            SizedBox(height: 15),
            Container(
              height: 45,
              width: 280,
              child: TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'E-Mail',prefixIcon: const Icon(Icons.email, color: Colors.grey)),
              ),
            ),

            SizedBox(height: 15),
            Container(
              height: 45,
              width: 280,
              child: TextFormField(

                decoration: textInputDecoration.copyWith(hintText: 'Room No.'),
              ),
            ),

            SizedBox(height: 15),
            Container(
              height: 45,
              width: 280,
              child: TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Mobile No.', prefixIcon: const Icon(Icons.local_phone, color: Colors.grey)),
              ),
            ),

            SizedBox(height: 15),
            Container(
              height: 45,
              width: 280,
              child: TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Create Password',prefixIcon: const Icon(Icons.lock, color: Colors.grey)),
              ),
            ),

            SizedBox(height: 15),
            Container(
              height: 45,
              width: 280,
              child: TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Confirm Password',prefixIcon: const Icon(Icons.lock, color: Colors.grey)),
              ),
            ),
            SizedBox(height: 40),
            Container(
              height: 40,
              width: 150,
              child: MaterialButton(
                child: Text('Register',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                color: Colors.purple,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                onPressed: () {
                  showDialog(
                    context: context,
                    // ignore: non_constant_identifier_names
                    builder: (BuildContext) => leadDialog);
                },
                
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: <Widget>[
                Text('     Already have an Account ?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black87),
                ),
                TextButton(child:
                  Text('Sign In',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) {
                      return LoginStudent();
                    }),
                    );
                  },
                )
              ],
            )




          ],
        ),
      ),
    );
  }
}
