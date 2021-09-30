import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String username;
  final String mobileNumber;
  final String email;
   final String userUid;
  UserModel({
     this.mobileNumber,
    this.username,
    this.email,
    this.userUid
});

  factory UserModel.fromDocument(DocumentSnapshot doc){
    return UserModel(
      username: doc["username"],
        userUid: doc["userUid"],
        mobileNumber: doc["mobileNumber"],
        email : doc["emailAddress"]
    );
  }
}