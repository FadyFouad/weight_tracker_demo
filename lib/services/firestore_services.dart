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
  Future updateUserBMI(String id,
      double height, double weight, double bmiValue, Timestamp date) async {
    return await collectionReference.doc(uid).set({
      Timestamp.now().toDate().toString(): {
        "id": id,
        "height": height,
        "weight": weight,
        "bmiValue": bmiValue,
        "date": date
      },
    }, SetOptions(merge: true));
  }

  Stream<List<BmiModel>> get bmi {
    // readNestedData();
    return collectionReference.snapshots().map(_bmiListFromSnapShot);
  }

  List<BmiModel> _bmiListFromSnapShot(QuerySnapshot snapShot) {
    // dynamic l = snapShot.docs
    //     .map((doc) => BmiModel(
    //   bmiValue: double.parse(doc.get("weight")) /
    //       pow(double.parse(doc.get("height")), 2),
    //   weight: doc.get('weight') ?? 0,
    //   height: doc.get('height') ?? 0,
    //   date: doc.get('date') ?? null,
    // ))
    //     .toList();
    dynamic d = FirebaseFirestore.instance
        .collection("6bulmxZRYsZEIzvPDjbhKzVOWgk2")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["2021-07-20 23:45:02.183272"]);
      });
    });

    print("#=====================================================#");
    print(d);

    return [
      BmiModel("", bmiValue: 1, weight: 2, height: 2, date: Timestamp.now())
    ];
  }

// void readNestedData(String uid) {
//   collectionReference.doc(uid).get().then((docSnapshot) {
//     print(docSnapshot.get('height'));
//   });
// }
}
