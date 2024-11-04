// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, camel_case_types, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screen/achievements.dart';
import 'Screen/carrier_objective.dart';
import 'Screen/contact_info.dart';
import 'Screen/declaration.dart';
import 'Screen/experiences.dart';
import 'Screen/personal_details.dart';
import 'Screen/projects.dart';
import 'Screen/references.dart';
import 'Screen/technical_skills.dart';
import 'Screen/splash_screen.dart';
import 'Screen/work_space.dart';
import 'Screen/eduction.dart';
import 'Screen/resume.dart';

void main() {
  SystemUiOverlayStyle(
    statusBarColor: Colors.black,
    systemNavigationBarColor: Colors.lightBlue,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleDarkMode(bool newValue) {
    setState(() {
      _isDarkMode = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      initialRoute: 'place_screen',
      routes: {
        '/': (context) => Home_Page(toggleDarkMode: _toggleDarkMode),
        'place_screen': (context) => Splash_Screen(),
        'contact_info': (context) => Contact_Info(),
        'work_space': (context) => Work_Space(),
        'carrier_objective': (context) => Carrier_Objective(),
        'personal_details': (context) => Personal_Details(),
        'eduction': (context) => Eduction(),
        'experiences': (context) => Experiences(),
        'technical_skills': (context) => Technical_Skills(),
        'projects_page': (context) => Projects_Page(),
        'achievements_page': (context) => Achievements_Page(),
        'declaration': (context) => declaration(),
        'resume': (context) => Resume(),
      },
      debugShowCheckedModeBanner: false,
      // home: Home_Page(),
    );
  }
}

class Home_Page extends StatefulWidget {
  final Function(bool) toggleDarkMode;

  const Home_Page({Key? key, required this.toggleDarkMode}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 190,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  Text(
                    "Houssem&Ghazi's CV Maker",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      "Your cv",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            color: Colors.blue,

          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Container(
                  child: Image.asset(
                    "img/open-cardboard-box.png",
                  ),
                  height: 50,
                  width: 100,
                  color: Colors.white10,
                ),
              ),
            ],
          ),
          Text(
            "Create new resume.",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black38),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('work_space');
        },
        child: Icon(Icons.add, size: 40),
      ),
      appBar: AppBar(
        actions: [
          Row(
            children: [
              Text(
                "Turn on dark mode",
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              Switch(
                value: Theme.of(context).brightness == Brightness.dark,
                onChanged: (newValue) {
                  widget.toggleDarkMode(newValue);
                },
                activeColor: Colors.yellow, // change color according to your preference
              ),
            ],
          ),
        ],
      ),
    );
  }
}
