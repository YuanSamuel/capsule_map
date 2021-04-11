import 'package:capsule_map/screens/capsules/opened_capsules_list.dart';
import 'package:capsule_map/screens/capsules/sent_capsules_list.dart';
import 'package:flutter/material.dart';

class CapsulesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Capsules',
              style: TextStyle(
                color: Color(0xFF030D56),
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text('Opened',
                      style: TextStyle(
                        color: Color(0xFF030D56),
                      )),
                ),
                Tab(
                  child:
                      Text('My Capsules', style: TextStyle(color: Color(0xFF030D56))),
                ),
              ],
              indicatorColor: Color(0xFF030D56),
            ),
            elevation: 1.0,
          ),
          backgroundColor: Colors.white,
          body: TabBarView(
            children: [
              OpenedCapsulesList(),
              SentCapsulesList(),
            ],
          )),
    );
  }
}
