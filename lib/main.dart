import 'package:capsule_map/screens/capsules/capsule_widget.dart';
import 'package:capsule_map/screens/capsules/capsules_screen.dart';
import 'package:capsule_map/screens/createcapsule_screen.dart';
import 'package:capsule_map/screens/profile_screen.dart';
import 'package:capsule_map/screens/signup_screen.dart';
import 'package:capsule_map/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateCapsuleScreen(),
    );
  }
}
