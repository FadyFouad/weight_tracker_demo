import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weight_tracker_demo/providers/tech_provider.dart';

///****************************************************
///*** Created by Fady Fouad on 07-Aug-21 at 19:33.***
///****************************************************

class TechInfo extends StatefulWidget {
  static const routeName = "TechInfo";

  const TechInfo({Key? key}) : super(key: key);

  @override
  _TechInfoState createState() => _TechInfoState();
}

class _TechInfoState extends State<TechInfo> {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final loadedTech = Provider.of<Techs>(context)
        .technicals
        .firstWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedTech.name),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  child: Column(
                    children: [
                      Container(
                        height: 35,
                      ),
                      Text(
                        loadedTech.name,
                      ),
                      Container(height: 5),
                      Text(
                        loadedTech.techType.toString(),
                        textAlign: TextAlign.center,
                      ),
                      Container(height: 5),
                      Text(
                        DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
                        textAlign: TextAlign.center,
                      ),
                      Container(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(width: 10),
                          CircleAvatar(
                            radius: 52,
                            backgroundColor: Colors.purple[600],
                            child: CircleAvatar(
                              radius: 49,
                              backgroundImage: AssetImage('assets/images/tslogo.png'),
                            ),
                          ),
                          Container(width: 10),
                        ],
                      ),
                      Container(height: 30),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Text(loadedTech.id),
                          Container(height: 5),
                          Text(
                            "Power",
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Text(
                            loadedTech.attendance.toString(),
                          ),
                          Container(height: 5),
                          Text(
                            "Attendance",
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Text(
                            "loadedTech.behaviour.toString()",
                          ),
                          Container(height: 5),
                          Text(
                            "Behavior",
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(height: 50),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text('loadedTech.desc'),
                ),
                Divider(height: 50),
                Row(
                  children: <Widget>[Container(width: 40), Container(width: 40)],
                ),
                Container(height: 30),
                Row(
                  children: <Widget>[
                    Container(width: 40),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Phone",
                          ),
                          Container(height: 5),
                          Text(loadedTech.phoneNum)
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "project",
                          ),
                          Container(height: 5),
                          Text(
                            "الهضبة",
                          )
                        ],
                      ),
                    ),
                    Container(width: 40)
                  ],
                ),
                Container(height: 30),
                Row(
                  children: <Widget>[
                    Container(width: 40),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "task #",
                          ),
                          Container(height: 5),
                          Text(
                            "65",
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Address",
                          ),
                          Container(height: 5),
                          Text(loadedTech.address)
                        ],
                      ),
                    ),
                    Container(width: 40)
                  ],
                ),
                Container(height: 50),
                Row(
                  children: <Widget>[
                    Container(width: 40),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "tools",
                          ),
                          Container(height: 5),
                          Text(
                            loadedTech.tools.join(","),
                          )
                        ],
                      ),
                    ),
                    Container(width: 40)
                  ],
                ),
                Container(height: 50),
                Row(
                  children: <Widget>[
                    Container(width: 40),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Notes",
                        ),
                        onChanged: (v) {},
                      ),
                    ),
                    Container(width: 40)
                  ],
                ),
                Container(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
