import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weight_tracker_demo/model/technical.dart';
import 'package:weight_tracker_demo/providers/tech_provider.dart';
import 'package:weight_tracker_demo/screens/technicans/tech_info.dart';

///****************************************************
///*** Created by Fady Fouad on 07-Aug-21 at 17:36.***
///****************************************************

class TechWidget extends StatelessWidget {
  final String id;
  final String name;
  final String url;

  const TechWidget(
      {Key? key, required this.id, required this.name, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final techData = Provider.of<Techs>(context);
    final techs = techData.technicals;
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            TechInfo.routeName,
            arguments: id,
          );
        },
        child: Container(
          child: ListTile(
            title: Text(name),
            subtitle: Text(id),
            leading: Image.asset('assets/images/tslogo.png'),
          ),
        ));
  }
}

class TechsList extends StatelessWidget {
  const TechsList({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final techsData = Provider.of<Techs>(context);
    final techsList = techsData.technicals;
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: techsList.length,
      // Provide a builder function. This is where the magic happens.
      // Convert each item into a widget based on the type of item it is.
      itemBuilder: (context, index) {
        return Container(
          // color: techsList[index].attendance == Attendance.ABSENCE ? Colors.red : null,
          child: TechWidget(
            id: techsList[index].id,
            name: techsList[index].name,
            url: techsList[index].id,
          ),
        );
      },
    );
  }
}