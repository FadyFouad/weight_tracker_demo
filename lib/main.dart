import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weight_tracker_demo/model/user.dart';
import 'package:weight_tracker_demo/screens/wrapper.dart';
import 'package:weight_tracker_demo/services/authenticate_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: StreamProvider<UserModel?>.value(
        value: AuthenticateService().user,
        initialData: UserModel(""),
        child: Wrapper(),
      ),
    );
  }
}
