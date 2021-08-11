import 'package:flutter/material.dart';
import 'package:weight_tracker_demo/screens/projects/projects.dart';
import 'package:weight_tracker_demo/screens/technicans/technicans.dart';

///****************************************************
///*** Created by Fady Fouad on 20-Jul-21 at 18:50.***
///****************************************************

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 1;
  final screens = [
    Projects(),
    Techn(),
  ];
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        iconSize: 40,
        selectedFontSize: 18,
        unselectedFontSize: 16,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree_outlined),
            label: 'Projects',
            //backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Technicians',
            //backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
/*
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<BmiModel>>.value(
      value: DataBaseServices().bmi,
      initialData: [],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Weight Tracker App'),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "your Height",
                    hintText: "175 Cm",
                  ),
                  onChanged: (v) {},
                ),
                TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "your weight",
                    hintText: "73 Kg",
                  ),
                  onChanged: (v) {},
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
                      UserCredential result =
                          await _firebaseAuth.signInAnonymously();
                      await DataBaseServices(uid: result.user!.uid)
                          .updateUserBMI(
                              result.user!.uid,
                              double.parse((heightController).text),
                              double.parse((weightController).text),
                              double.parse((weightController).text) /
                                  pow(double.parse((heightController).text), 2),
                              Timestamp.now());
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text("Calc"),
                ),
                Expanded(child: BmiList()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
