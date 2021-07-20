import 'package:flutter/material.dart';
import 'package:weight_tracker_demo/services/authenticate_service.dart';

///****************************************************
///*** Created by Fady Fouad on 20-Jul-21 at 19:25.***
///****************************************************


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthenticateService _firebaseAuth = AuthenticateService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text('sign In Anonymously'),
            onPressed: () async {
              dynamic result = await _firebaseAuth.signInAnonymous();
              if (result == null) {
                print('Failed to sign in');
              } else {
                print("user id" + result.uid + " => " + result.name);
              }
            },
          ),
        ),
      ),
    );
  }
}