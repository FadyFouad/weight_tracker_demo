import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weight_tracker_demo/model/technical.dart';
import 'package:weight_tracker_demo/providers/tech_provider.dart';

///****************************************************
///*** Created by Fady Fouad on 08-Aug-21 at 00:11.***
///****************************************************

class AddNewTechWidget extends StatelessWidget {
  const AddNewTechWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    final techList = Provider.of<Techs>(context);

    return Container(
      child: Column(
        children: <Widget>[
        TextField(
        controller: nameController,
        decoration: InputDecoration(
          labelText: "tech name",
        ),
        onChanged: (v) {},
      ),
      TextField(
        controller: addressController,
        decoration: InputDecoration(
          labelText: "tech address",
        ),
        onChanged: (v) {

        },
      ),
      ElevatedButton(
        onPressed: () {

        },
        child: Text("Add"),
      ),
    ]));
  }
}
