import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weight_tracker_demo/model/bmi_model.dart';

///****************************************************
///*** Created by Fady Fouad on 20-Jul-21 at 21:07.***
///****************************************************

class DataBaseServices {
  final String? uid;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("BMI");

  DataBaseServices({this.uid});

  //create new record in firestore
  Future updateUserBMI(
      double height, double weight, double bmiValue, Timestamp date) async {
    return await collectionReference.doc(uid).set({
      Timestamp.now().toDate().toString(): {
        "height": height,
        "weight": weight,
        "bmiValue": bmiValue,
        "date": date
      },
    },SetOptions(merge: true));
  }

  Stream<List<BmiModel>> get bmi {
    return collectionReference.snapshots().map(_BmiListFromSnapShot);
  }

  List<BmiModel> _BmiListFromSnapShot(QuerySnapshot snapShot) {
    return snapShot.docs
        .map((doc) => BmiModel(
              bmiValue: doc.get("weight") / doc.get("height") ?? 0.0,
              weight: doc.get('weight') ?? 0,
              height: doc.get('height') ?? 0,
              date: doc.get('date') ?? null,
            ))
        .toList();
  }
}
