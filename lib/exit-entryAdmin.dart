import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:hostelite/alerts_admin.dart';
import 'package:hostelite/edit_profile_Admin.dart';
import 'package:hostelite/home_screen_Admin.dart';
import 'package:hostelite/home_screen_Student.dart';
import 'package:hostelite/rejected_complaints.dart';
import 'package:hostelite/shared_files/decoration.dart';

class EntryListAdmin extends StatefulWidget {
  const EntryListAdmin({Key key}) : super(key: key);

  @override
  _EntryListAdminState createState() => _EntryListAdminState();
}

class _EntryListAdminState extends State<EntryListAdmin> {

  String dropdownvalue = "Hostel";
  var items = ['Hostel','Ganga','Kosi','Son','Brahmaputra'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(

        preferredSize: Size.fromHeight(100),
        child: AppBar(
          leading: BackButton(
              color: Colors.black
          ),
          title: Text('Entry-Exit Reports',
            style: TextStyle(
              color: Color(0xff4E4E4E),
            ),),


          backgroundColor: Color(0xffFE96FA),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(

              alignment: AlignmentDirectional.topEnd,
              child: Padding(

                padding: EdgeInsets.fromLTRB(0, 5, 15, 5),
                child: DropdownButton(

                  value: dropdownvalue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items:items.map((String items) {
                    return DropdownMenuItem(
                        value: items,
                        child: Text(items)
                    );
                  }
                  ).toList(),
                  onChanged: (String newValue){
                    setState(() {
                      dropdownvalue = newValue;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            Table(
              border: TableBorder.all(width: 1.0,color: Colors.white),
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: Color(0xff8D8D8D)
                  ),
                  children: [
                    Center(child: Text('Entry',style: TextStyle(color: Colors.white),)),
                    Center(child: Text('Exit',style: TextStyle(color: Colors.white,fontSize: 20),)),
                    Center(child: Text('Roll No',style: TextStyle(color: Colors.white),)),
                    Center(child: Text('Hostel',style: TextStyle(color: Colors.white,fontSize: 40),)),
                  ]
                ),TableRow(
                  decoration: BoxDecoration(
                    color: Color(0xffC8F2FF)
                  ),
                  children: [
                    Text('Entry'),
                    Text('Exit'),
                    Text('Roll No'),
                    Text('Hostel'),
                  ]
                ),TableRow(
                  decoration: BoxDecoration(
                    color: Color(0xff89E3FF),
                  ),
                  children: [
                    Text('Entry'),
                    Text('Exit'),
                    Text('Roll No'),
                    Text('Hostel'),
                  ]
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar:  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey[300],
          ),

        ),
        height: 45,
        width: 380,
        child: Row(
          children: <Widget>[
            Spacer(),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) {
                        return HomeScreenAdmin( );
                      }
                  ),
                );
              },
              child: Icon(

                Icons.home_filled,
              ),
            ),
            Spacer(),
            //SizedBox(width: 10),
            MaterialButton(
              onPressed: () {},
              child: Icon(
                Icons.graphic_eq,
                color:Color(0xffF989E7),
              ),
            ),
            Spacer(),
            //SizedBox(width: 10),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) {
                        return Alerts();
                      }
                  ),
                );
              },
              child: Icon(
                Icons.add_alert,
              ),
            ),
            Spacer(),
            //SizedBox(width: 10),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) {
                        return EditProfileAdmin();
                      }
                  ),
                );
              },
              child: Icon(
                Icons.person,
              ),
            ),
            Spacer(),


          ],
        ),
      ),


    );
  }
}

