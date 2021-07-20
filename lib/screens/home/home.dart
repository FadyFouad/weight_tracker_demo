import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:weight_tracker_demo/services/firestore_services.dart';

///****************************************************
///*** Created by Fady Fouad on 20-Jul-21 at 18:50.***
///****************************************************

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight Tracker App'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "your Height",
                    hintText: "175 Cm",
                  ),
                  onChanged: (v) {},
                ),
              ),
              Flexible(
                child: TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "your weight",
                    hintText: "73 Kg",
                  ),
                  onChanged: (v) {},
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await DataBaseServices(uid: "6bulmxZRYsZEIzvPDjbhKzVOWgk2").updateUserBMI(
                      double.parse((heightController).text),
                      double.parse((weightController).text),
                      double.parse((heightController).text) /
                          pow(double.parse((weightController).text), 2),
                      Timestamp.now());
                },
                child: Text("Calc"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
