import 'package:flutter/material.dart';

class EditProfileAdmin extends StatefulWidget {
  const EditProfileAdmin({Key key}) : super(key: key);

  @override
  _EditProfileAdminState createState() => _EditProfileAdminState();
}

class _EditProfileAdminState extends State<EditProfileAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 50, 15, 15),
              child: Column(children: [
                Row(children: [IconButton(
                    icon: Icon( Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),),
                     SizedBox(width: 50,),
                     Text(
                         'Edit Profile',
                           style:TextStyle(
                             fontSize: 24,
                             color: Color(0xff747475)
                           )
                     ),
                  


                ]
                ),
                SizedBox(height: 35,),
                CircleAvatar(
                  radius: 85,
                  backgroundColor: Colors.orange[100],
                ),
                SizedBox(height: 35,),
                TextFormField(
                  decoration: InputDecoration(

                    labelText: 'Name',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(

                            color: Colors.grey,
                            width: 1.0
                        )
                    ),

                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.cyan,
                            width: 1.0
                        )
                    ),
                  ),
                ),
                SizedBox(height: 28,),

                TextFormField(
                  decoration: InputDecoration(

                    labelText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(

                            color: Colors.grey,
                            width: 1.0
                        )
                    ),

                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.cyan,
                            width: 1.0
                        )
                    ),
                  ),
                ),

                SizedBox(height: 28,),

                TextFormField(
                  decoration: InputDecoration(

                    labelText: 'Mobile number',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(

                            color: Colors.grey,
                            width: 1.0
                        )
                    ),

                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.cyan,
                            width: 1.0
                        )
                    ),
                  ),
                ),
                SizedBox(height:50),
                
                Container(
                  width: 130,
                  height: 50,
                  child: MaterialButton(
                    child: Text('Save',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    color: Colors.purple,
                    minWidth: 100,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {  },

                  ),
                ),

                


              ]),
            ),
          ),
        )
      ),
    );
  }
}
