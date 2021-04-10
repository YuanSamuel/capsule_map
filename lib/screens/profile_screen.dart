import 'package:capsule_map/services/auth_service.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text('Profile'),
          ),
          TextButton(
            onPressed: () {
              AuthService().signOut();
            },
            child: Text('Log Out'),
          ),
        ],
      ),
    );
  }
}
