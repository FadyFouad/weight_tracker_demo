import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weight_tracker_demo/model/user.dart';
import 'package:weight_tracker_demo/screens/wrapper.dart';
import 'package:weight_tracker_demo/services/authenticate_service.dart';

/*
After sign in, the app shows a page where the user can: ✓
•TODO Enter his/her weight and height into a form and submit it ✓✓
•TODO Save this along with the BMI and Weight Status and  the current time into Firestore ✓✓✓
•TODO View a list of all weight entries, sorted by most recent date ✓✓✓✓
*/


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
