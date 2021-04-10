import 'package:capsule_map/services/auth_service.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontFamily: 'Open_Sans',
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 120.0,
                backgroundImage: AssetImage('images/dog.png'),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              child: Center(
                child: Text(
                  'Bob Jones',
                  style: TextStyle(
                    fontFamily: 'Open_Sans',
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '10',
                          style: TextStyle(
                            fontFamily: 'Open-Sans',
                            fontSize: 20.0,
                            color: Colors.blue[900],
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Capsules Created',
                          style: TextStyle(
                            fontFamily: 'Open-Sans/OpenSans-Light.ttf',
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * 0.06,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '5',
                          style: TextStyle(
                            fontFamily: 'Open-Sans',
                            fontSize: 20.0,
                            color: Colors.blue[900],
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Capsules Opened',
                          style: TextStyle(
                            fontFamily: 'Open-Sans/OpenSans-Light.ttf',
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'View Friends',
                      style: TextStyle(
                        fontFamily: 'Open_Sans',
                        fontSize: 18.0,
                      ),
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      child: Icon(
                        Icons.chevron_right,
                        size: 40.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 30.0,
              thickness: 1.0,
              color: Colors.blue[900],
              indent: 20,
              endIndent: 20,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add A Friend',
                      style: TextStyle(
                        fontFamily: 'Open_Sans',
                        fontSize: 18.0,
                      ),
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      child: Icon(
                        Icons.chevron_right,
                        size: 40.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 30.0,
              thickness: 1.0,
              color: Colors.blue[900],
              indent: 20,
              endIndent: 20,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Friend Requests',
                      style: TextStyle(
                        fontFamily: 'Open_Sans',
                        fontSize: 18.0,
                      ),
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      child: Icon(
                        Icons.chevron_right,
                        size: 40.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 30.0,
              thickness: 1.0,
              color: Colors.blue[900],
              indent: 20,
              endIndent: 20,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Log Out',
                      style: TextStyle(
                        fontFamily: 'Open_Sans',
                        fontSize: 18.0,
                      ),
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      child: Icon(
                        Icons.chevron_right,
                        size: 40.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 30.0,
              thickness: 1.0,
              color: Colors.blue[900],
              indent: 20,
              endIndent: 20,
            ),
          ],
        ),
      ),
    );
  }
}
