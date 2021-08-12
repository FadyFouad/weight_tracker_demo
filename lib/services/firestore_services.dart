import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weight_tracker_demo/model/user.dart';

///****************************************************
///*** Created by Fady Fouad on 20-Jul-21 at 21:07.***
///****************************************************

class DataBaseServices {
  final String? uid;

  final CollectionReference usersCollectionReference =
      FirebaseFirestore.instance.collection("Users");
  final CollectionReference technicalsCollectionReference =
      FirebaseFirestore.instance.collection("Technicals");
  final CollectionReference projectsCollectionReference =
      FirebaseFirestore.instance.collection("Projects");
  final CollectionReference toolsCollectionReference =
      FirebaseFirestore.instance.collection("Tools");

  DataBaseServices({this.uid});

  //create new record in firestore
  Future updateUserData(
      {required String uid,
      required String displayName,
      required String email,
      required String phoneNumber,
      required String photoURL,
      required int type,
      required DateTime? creationTime}) async {
    print(UserType.ADMIN.toString().split('.').last);
    return await usersCollectionReference.doc(uid).set({
      Timestamp.now().toDate().toString(): {
        "uid": uid,
        "creationTime": displayName,
        "email": email,
        "phoneNumber": phoneNumber,
        "PhotoURL": photoURL,
        "type": UserType.ADMIN.toString().split('.').last,
        "date": creationTime
      },
    }, SetOptions(merge: true));
  }
}
