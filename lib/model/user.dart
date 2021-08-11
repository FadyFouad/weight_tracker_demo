///****************************************************
///*** Created by Fady Fouad on 20-Jul-21 at 19:15.***
///****************************************************

class UserModel {
  final String uid;
  final String name;
  final UserType type;
  final String createdDate;

  UserModel(
      {required this.uid,
      required this.name,
      required this.type,
      required this.createdDate});
}

enum UserType { ADMIN, SUPERVISOR, ENGINEER, TECHNICAl }
