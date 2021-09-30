import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:hostelite/models/user_model.dart';

class StudentComplaintList extends StatefulWidget {
  const StudentComplaintList({Key key}) : super(key: key);

  @override
  _StudentComplaintListState createState() => _StudentComplaintListState();
}

class _StudentComplaintListState extends State<StudentComplaintList> {

  String complaints;
  Future getCurrentStudentComplaintsDataFunction()  async {

    complaints = FirebaseFirestore.instance.
    collection("studentUsers").
    doc(FirebaseAuth.instance.currentUser.uid).
    collection("complaints").
    doc(FirebaseAuth.instance.currentUser.uid)
        .get().toString();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Complaints'),
        backgroundColor: Color(0xffFE96FA),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("studentUsers")
          .doc(FirebaseAuth.instance.currentUser.uid).collection("complaints").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data.docs.map((document) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffFDFDFD),
                      boxShadow: [

                        BoxShadow(
                          color: Color(0xffC1C1C1),
                          blurRadius: 5.0, // soften the shadow
                          spreadRadius: 2.0, //extend the shadow
                          offset: Offset(
                            2.0, // Move to right 10  horizontally
                            2.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,0, 0, 0),
                            child: Text(document['issue'],
                            style: TextStyle(
                              color: Color(0xff565656),
                              fontWeight: FontWeight.w500,
                              fontSize: 18
                            ),
                            ),
                          ),

                          const Divider(
                            color: Color(0xffC1C1C1),
                            height: 25,
                            thickness: 2,
                            indent: 5,
                            endIndent: 5,
                          ),


                          Card(
                            child: Image.network(document['imageUrl'])
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:8,horizontal: 0),
                            child: Text(document['explanation'],
                              style: TextStyle(
                                  color: Color(0xff5C5C5C),

                                  fontSize: 16
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(document['status']),
                              Text(DateTime.now().toString())
                            ],
                          )



                        ],
                      ),

                    )),
              );
            }).toList(),
            // child: Text(
            //   'complaints'
                // FirebaseFirestore.instance.
                // collection("studentUsers").
                // doc(FirebaseAuth.instance.currentUser.uid).
                // collection("complaints").
                // doc(FirebaseAuth.instance.currentUser.uid).snapshots().toString()

          );
        }
      ),
    );
  }
}
