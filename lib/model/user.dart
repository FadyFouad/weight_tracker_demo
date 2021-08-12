import 'package:cloud_firestore/cloud_firestore.dart';

///****************************************************
///*** Created by Fady Fouad on 20-Jul-21 at 19:15.***
///****************************************************

class UserModel {
  final String uid;
  final String displayName;
  final String email;
  final String phoneNumber;
  final String photoURL;
  final UserType type;
  final DateTime creationTime;

  UserModel(
      {required this.email,
      required this.phoneNumber,
      required this.photoURL,
      required this.uid,
      required this.displayName,
      required this.type,
      required this.creationTime});
}

enum UserType {
  TECHNICAl,
  ENGINEER,
  ADMIN,


}
