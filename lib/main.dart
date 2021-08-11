import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weight_tracker_demo/model/user.dart';
import 'package:weight_tracker_demo/providers/tech_provider.dart';
import 'package:weight_tracker_demo/screens/technicans/tech_info.dart';
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
    return ChangeNotifierProvider(
      create: (ctx)=> Techs(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamProvider<UserModel?>.value(
          value: AuthenticateService().user,
          initialData: null,
          child: Wrapper(),
        ),
        routes: {
          TechInfo.routeName:(_)=> TechInfo(),
        },
      ),
    );
  }
}
