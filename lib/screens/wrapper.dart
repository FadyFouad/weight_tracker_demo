import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weight_tracker_demo/model/user.dart';
import 'package:weight_tracker_demo/screens/authenticate/authenticate.dart';

import 'authenticate/sign_in.dart';
import 'home/home.dart';


///****************************************************
///*** Created by Fady Fouad on 20-Jul-21 at 19:06.***
///****************************************************

//this widget control @home screen
//show @authenticate screen if user logged out or home screen if user logged in
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    return user == null ? SignIn() : Home();
  }
}
