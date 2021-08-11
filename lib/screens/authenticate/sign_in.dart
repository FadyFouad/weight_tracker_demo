import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weight_tracker_demo/screens/home/home.dart';
import 'package:weight_tracker_demo/services/authenticate_service.dart';

import '../Register.dart';
import '../ResetPass.dart';

///****************************************************
///*** Created by Fady Fouad on 20-Jul-21 at 19:25.***
///****************************************************

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  static bool _passwordVisible = false;
  static bool visible = false;
  static bool gvisible = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _emailidController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final AuthenticateService _firebaseAuth = AuthenticateService();

  void initState() {
    super.initState();
    visible = false;
    gvisible = false;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 120.0, bottom: 0.0),
                  child: Text(
                    '',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 50.0),
                  child: Center(
                    child: Container(
                        //padding:
                        //  const EdgeInsets.only(top: 30.0, bottom: 30.0),
                        width: 200,
                        height: 150,
                        decoration: BoxDecoration(
                            //color: Colors.white10,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Image.asset('assets/images/tslogo.png')),
                  ),
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _emailidController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail_outline_rounded,
                          color: Colors.white70,
                        ),
                        filled: true,
                        fillColor: Colors.black12,
                        enabledBorder: OutlineInputBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.5),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: ''),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 10.0, bottom: 30.0),
                  //padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _passwordController,
                    obscureText: !_passwordVisible,
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          color: Colors.white70,
                        ),
                        suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white70,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            }),
                        filled: true,
                        fillColor: Colors.black12,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: ''),
                  ),
                ),
                Container(
                  height: 50,
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (!_emailidController.text.contains('@')) {
                        displayToastMessage('Invalid Email-ID', context);
                      } else if (_passwordController.text.length < 8) {
                        displayToastMessage('Password incorrect', context);
                      } else {
                        setState(() {
                          // visible = load(visible);
                        });
                        // login();
                        dynamic result =
                            await _firebaseAuth.signInWithEmailANdPassword(
                                _emailidController.text,
                                _passwordController.text);
                        print(result);
                        if (result != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Home()));
                        }
                      }
                    },
                    child: Text(
                      'Login',
                      //style: TextStyle(color: Colors.white, fontSize: 20,),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black45,
                      onPrimary: Colors.white,
                      shadowColor: Colors.black45,
                      elevation: 8,
                      //side: BorderSide(color: Colors.white70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: Colors.white70,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: visible,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                            width: 320,
                            margin: EdgeInsets.only(),
                            child: LinearProgressIndicator(
                              minHeight: 2,
                              backgroundColor: Colors.blueGrey[800],
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            )))),
                Container(
                  height: 30,
                  width: 300,
                  child: TextButton(
                    onPressed: () {
                      SchedulerBinding.instance!.addPostFrameCallback((_) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ResetPass()));
                      });
                    },
                    child: Text(
                      'Forgot Password?',
                    ),
                  ),
                ),
                Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: gvisible,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                            width: 320,
                            margin: EdgeInsets.only(bottom: 20),
                            child: LinearProgressIndicator(
                              minHeight: 2,
                              backgroundColor: Colors.blueGrey[800],
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            )))),
                Container(
                  height: 30,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Register()));
                    },
                    child: Text(
                      'Create Account',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

displayToastMessage(String msg, BuildContext context) {
  Fluttertoast.showToast(msg: msg);
}
