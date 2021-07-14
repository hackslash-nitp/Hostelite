import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:hostelite/home_screen_Student.dart';
import 'package:hostelite/shared_files/decoration.dart';

class MarkingExit extends StatefulWidget {
  const MarkingExit({Key key}) : super(key: key);

  @override
  _MarkingExitState createState() => _MarkingExitState();
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
        Text('Exit Marked',
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

class _MarkingExitState extends State<MarkingExit> {
  /*String _myActivity;
  String _myActivityResult;
  final formKey = new GlobalKey<FormState>();

  void initState(){
    super .initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _saveForm(){
    var form = formKey.currentState;
    if (form.validate()){
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Mark Exit',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
        elevation: 10,
        backgroundColor: Colors.pinkAccent[100],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/second_page/Group 33694.png'),
                  fit: BoxFit.contain
              )
          ),
          child: Column(
            children: <Widget>[
              Card(
                child: TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Room No.'),
                ),
              ),
              Card(
                child: TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Roll No.'),
                ),
              ),
              /*Card(
                child: TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Purposse of Entry'),
                ),
              ),*/
              Card(
                child: DropdownButtonFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Hostel Name'),
                 /* value: _myActivity,
                  onSaved: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },*/ items: [

                ],
                ),
              ),
              SizedBox(height: 50),
              Container(
                width: 130,
                height: 50,
                child: MaterialButton(
                  child: Text('Mark Exit',
                    style: TextStyle(color: Colors.black87, fontSize: 15),
                  ),
                  color: Colors.pinkAccent,
                  minWidth: 100,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () async {
                    showDialog(
                        context: context,
                        // ignore: non_constant_identifier_names
                        builder: (BuildContext) => leadDialog
                    );
                  },
                ),
              ),
              Container(

              )
            ],
          ),
        ),
      ),
    );
  }
}
