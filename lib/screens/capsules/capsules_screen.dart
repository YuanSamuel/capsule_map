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
            title: Text('Capsules'),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text('Opened'),
                ),
                Tab(
                  child: Text('Sent'),
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
