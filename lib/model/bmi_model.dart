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

}
