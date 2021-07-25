import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alerts extends StatefulWidget {
  const Alerts({Key key}) : super(key: key);

  @override
  _AlertsState createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {

  String dropdownvalue = "Hostel";
  var items = ['Hostel','Ganga','Kosi','Son','Brahmaputra'];
  final now = DateTime.now();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(

        preferredSize: Size.fromHeight(100),
        child: AppBar(
          leading: BackButton(
              color: Colors.black
          ),
          title: Text('Alerts',
            style: TextStyle(
              color: Color(0xff4E4E4E),
            ),),


          backgroundColor: Color(0xffFE96FA),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow:[ BoxShadow(

                color: Colors.tealAccent.withOpacity(0.1),
                spreadRadius: 5
              ),
              ]
            ),
            child: Row(
            children: [
              Padding(
                padding:EdgeInsets.fromLTRB(30, 5, 30, 5),
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
              Spacer(),
              Padding(
                padding:EdgeInsets.fromLTRB(30, 5, 30, 5),
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
                //Drop Down DatePicker Package required to be installed in pubspec

                //child: DropdownDatePicker(
                  //firstDate: ValidDate(year: now.year - 100, month: 1, day: 1),
                  //lastDate: ValidDate(year: now.year, month: now.month, day: now.month),


            ],
            ),
          ),
          SizedBox(height: 20,),
          Container(

            child: Padding(
              padding: EdgeInsets.fromLTRB(15,0,15,0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Ramesh Kumar',
                                style: TextStyle(
                                    color: Color(0xff565656),
                                    fontSize: 15
                                ),),
                              Text('Room No. 087',
                              style: TextStyle(
                                fontSize: 12
                              ),),
                            ],
                          ),
                          Spacer(),
                          Text(DateTime.now().day.toString()+'.'+DateTime.now().month.toString()+'.'+DateTime.now().year                     .toString(),
                            style: TextStyle(
                                color: Color(0xff9F9F9F)
                            ),)
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 5,),
                      Text('Sir I went to purchase a book , but while returning it satrted raining . So there was                              no any options left for me then waiting at  the store until the rain stopped.'),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            DateTime.now().toString(),
                            style: TextStyle(
                                color: Color(0xff9F9F9F)
                            ),)
                        ],
                      )

                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(

            child: Padding(
              padding: EdgeInsets.fromLTRB(15,0,15,0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Ramesh Kumar',
                              style: TextStyle(
                                color: Color(0xff565656),
                                fontSize: 15
                              ),),
                              Text('Room No. 087'),
                            ],
                          ),
                          Spacer(),
                          Text(DateTime.now().day.toString()+'.'+DateTime.now().month.toString()+'.'+DateTime.now().year                     .toString(),
                            style: TextStyle(
                                color: Color(0xff9F9F9F)
                            ),)
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 5,),
                      Text('Sir I went to purchase a book , but while returning it satrted raining . So there was                              no any options left for me then waiting at  the store until the rain stopped.'),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            DateTime.now().toString(),
                            style: TextStyle(
                                color: Color(0xff9F9F9F)
                            ),)
                        ],
                      )

                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(

            child: Padding(
              padding: EdgeInsets.fromLTRB(15,0,15,0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Ramesh Kumar',
                                style: TextStyle(
                                    color: Color(0xff565656),
                                    fontSize: 15
                                ),),
                              Text('Room No. 087'),
                            ],
                          ),
                          Spacer(),
                          Text(DateTime.now().day.toString()+'.'+DateTime.now().month.toString()+'.'+DateTime.now().year                     .toString(),
                            style: TextStyle(
                                color: Color(0xff9F9F9F)
                            ),)
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 5,),
                      Text('Sir I went to purchase a book , but while returning it satrted raining . So there was                              no any options left for me then waiting at  the store until the rain stopped.'),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            DateTime.now().toString(),
                            style: TextStyle(
                                color: Color(0xff9F9F9F)
                            ),)
                        ],
                      )

                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
          ),
      ),

    );
  }
}
