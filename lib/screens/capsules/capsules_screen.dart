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
            title: Text('Capsules',
                style: TextStyle(
                  color: Colors.lightBlue[900],
                )),
            backgroundColor: Colors.blueGrey[100],
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text('Opened',
                      style: TextStyle(
                        color: Colors.lightBlue[900],
                      )),
                ),
                Tab(
                  child: Text('Sent',
                      style: TextStyle(color: Colors.lightBlue[900])),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              OpenedCapsulesList(),
              SentCapsulesList(),
            ],
          )),
    );
  }
}
