import 'package:cloud_firestore/cloud_firestore.dart';

class StudentUserModel{
  final String username;
  final String roomNumber;
  final String rollNumber;
  final String mobileNumber;
  final String email;
  final String userUid;
  StudentUserModel({
    this.rollNumber,
    this.roomNumber,
    this.mobileNumber,
    this.username,
    this.email,
    this.userUid
  });

  factory StudentUserModel.fromDocument(DocumentSnapshot doc){
    return StudentUserModel(
        username: doc["username"],
        userUid: doc["userUid"],
        mobileNumber: doc["mobileNumber"],
        email : doc["email"],
        rollNumber: doc["rollNumber"],
      roomNumber: doc["roomNumber"]
    );
  }
}