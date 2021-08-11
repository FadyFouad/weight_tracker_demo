import 'package:flutter/material.dart';

///****************************************************
///*** Created by Fady Fouad on 31-Jul-21 at 15:52.***
///****************************************************

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المشروعات'),
      ),
      body: Center(
        child: Text('projects'),
      ),
    );
  }
}
