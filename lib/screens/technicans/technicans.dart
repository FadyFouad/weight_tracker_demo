import 'package:flutter/material.dart';
import 'package:weight_tracker_demo/widgets/add_new_tech_widget.dart';
import 'package:weight_tracker_demo/widgets/techns_widget.dart';

///****************************************************
///*** Created by Fady Fouad on 31-Jul-21 at 15:53.***
///****************************************************

class Techn extends StatefulWidget {
  const Techn({Key? key}) : super(key: key);

  @override
  _TechnState createState() => _TechnState();
}

class _TechnState extends State<Techn> {
  @override
  Widget build(BuildContext context) {
    void _addNewTech() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Center(
              child: Container(
                child: AddNewTechWidget(),
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('الفنيين'),
      ),
      body: Center(
        child: TechsList(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.person_add),
        onPressed: () => _addNewTech(),
      ),
    );
  }
}
