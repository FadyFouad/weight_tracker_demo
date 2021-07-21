import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weight_tracker_demo/model/bmi_model.dart';

///****************************************************
///*** Created by Fady Fouad on 21-Jul-21 at 10:04.***
///****************************************************

class BmiList extends StatefulWidget {
  const BmiList({Key? key}) : super(key: key);

  @override
  _BmiListState createState() => _BmiListState();
}

class _BmiListState extends State<BmiList> {
  @override
  Widget build(BuildContext context) {
    final bmiList = Provider.of<List<BmiModel>>(context);
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Text(bmiList[index].date.toString());
        },
        itemCount: bmiList.length,
      ),
    );
  }
}
