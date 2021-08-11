import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weight_tracker_demo/model/bmi_model.dart';

///****************************************************
///*** Created by Fady Fouad on 20-Jul-21 at 21:07.***
///****************************************************

class DataBaseServices {
  final String? uid;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("BMI");
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
  Future updateUserBMI(String id, double height, double weight, double bmiValue,
      Timestamp date) async {
    return await usersCollectionReference.doc(uid).set({
      Timestamp.now().toDate().toString(): {
        "id": id,
        "height": height,
        "weight": weight,
        "bmiValue": bmiValue,
        "date": date
      },
    }, SetOptions(merge: true));
  }

  //create new record in firestore
  Future updateUserData(
      {required String id,
      required String name,
      required String email,
      required String photoURL,
      required int type,
      required DateTime? date}) async {
    return await collectionReference.doc(uid).set({
      Timestamp.now().toDate().toString(): {
        "id": id,
        "name": name,
        "email": email,
        "PhotoURL": photoURL,
        "type": type,
        "date": date
      },
    }, SetOptions(merge: true));
  }

  Stream<List<BmiModel>> get bmi {
    // readNestedData();
    return collectionReference.snapshots().map(_bmiListFromSnapShot);
  }

  List<BmiModel> _bmiListFromSnapShot(QuerySnapshot snapShot) {
    Map map = snapShot.docs.first.data() as Map;
    var mapKey = map.keys;
    print(mapKey);
    Map<String, dynamic> data;
    List<BmiModel> bmilList = [];
    for (var k in mapKey) {
      data = map[k];
      data.forEach((key, value) {
        bmilList.add(BmiModel(data['id'],
            bmiValue: data['bmiValue'],
            weight: data['weight'],
            height: data['height'],
            date: data['date']));
      });
    }
    return bmilList.reversed.toList();
  }
}
