import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class FriendRequestScreen extends StatefulWidget {
  @override
  _FriendRequestScreenState createState() => _FriendRequestScreenState();
}

class _FriendRequestScreenState extends State<FriendRequestScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          ),
          title: Text(
            'Friend Request',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 150.0, vertical: 50.0),
            child: Column(
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Text(
                    'Abdur Aziz',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF616161),
                    ),
                  ),
                  SizedBox(width: 50),
                  IconButton(
                    icon: Icon(
                      Icons.check,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      // do something
                    },
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(
                      Icons.close_rounded,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      // do something
                    },
                  ),

                ]),
                SizedBox(height: 15),
                Divider(
                  height: 20,
                  thickness: 1,
                  color: Colors.black,
                ),
                SizedBox(height: 15),

                Row(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Abdur Aziz',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF616161),
                  ),
                ),
                SizedBox(width: 50),
                IconButton(
                  icon: Icon(
                    Icons.check,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // do something
                  },
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(
                    Icons.close_rounded,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // do something
                  },
                ),
              ]),
                SizedBox(height: 15),
                Divider(
                  height: 20,
                  thickness: 1,
                  color: Colors.black,
                ),
                SizedBox(height: 15),

                Row(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Abdur Aziz',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF616161),
                        ),
                      ),
                      SizedBox(width: 50),
                      IconButton(
                        icon: Icon(
                          Icons.check,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // do something
                        },
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        icon: Icon(
                          Icons.close_rounded,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // do something
                        },
                      ),
                    ]),
                SizedBox(height: 15),
                Divider(
                  height: 20,
                  thickness: 1,
                  color: Colors.black,
                ),
                SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: ClipOval(
                          child:
                          Image.asset('assets/testpfp.jpg')),
                      radius: 25.0,
                    ),
                    Text(
                      'Abdur Aziz',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF616161),
                      ),
                    ),
                    SizedBox(width: 50),
                    IconButton(
                      icon: Icon(
                        Icons.check,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // do something
                      },
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // do something
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
