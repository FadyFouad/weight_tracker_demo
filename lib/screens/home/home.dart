import 'package:flutter/material.dart';

///****************************************************
///*** Created by Fady Fouad on 20-Jul-21 at 18:50.***
///****************************************************

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weight Tracker App'),
        ),
        body: Container(
          child: Center(child: Text("Home")),
        ),
      );
  }
}
