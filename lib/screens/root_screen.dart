import 'package:capsule_map/screens/capsules/capsules_screen.dart';
import 'package:capsule_map/screens/home_screen.dart';
import 'package:capsule_map/screens/profile_screen.dart';
import 'package:capsule_map/screens/signup_screen.dart';
import 'package:capsule_map/stores/mainStore/main_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  List<Widget> screens = [HomeScreen(), CapsulesScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    MainStore mainStore = Provider.of<MainStore>(context);
    return Observer(
        builder: (_) => mainStore.loggedIn
            ? Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  onTap: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined), label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.list_outlined), label: 'Capsules'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person_outline), label: 'Profile'),
                  ],
                ),
                body: screens[_currentIndex],
              )
            : SignUpScreen());
  }
}
