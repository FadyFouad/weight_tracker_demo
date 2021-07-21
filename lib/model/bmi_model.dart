import 'package:cloud_firestore/cloud_firestore.dart';

///****************************************************
///*** Created by Fady Fouad on 20-Jul-21 at 21:18.***
///****************************************************

class BmiModel {
  final String id;
  final double weight;
  final double height;
  final double bmiValue;
  final Timestamp date;

  BmiModel(this.id, {required this.bmiValue,
    required this.weight, required this.height, required this.date});


// BmiModel.fromMap(Map<String,dynamic>data, this.id, this.weight, this.height, this.bmiValue, this.date){
//   id = data['id'];
//   weight = data['id'];
//   height = data['id'];
//   bmiValue = data['id'];
//   date = data['id'];
}
