import 'package:capsule_map/screens/profile/addfriends_screen.dart';
import 'package:capsule_map/screens/profile/friendrequest_screen.dart';
import 'package:capsule_map/screens/profile/myfriends_screen.dart';
import 'package:capsule_map/services/auth_service.dart';
import 'package:capsule_map/stores/mainStore/main_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    MainStore mainStore = Provider.of<MainStore>(context);

    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: Colors.blue[50],
        body: SafeArea(
          child: SingleChildScrollView(
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
                    radius: 100.0,
                    backgroundImage: AssetImage('images/dog.png'),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  child: Center(
                    child: Text(
                      mainStore.userStore.user.username,
                      style: TextStyle(
                        fontFamily: 'Open_Sans',
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
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
                              mainStore.userStore.user.capsules.length
                                  .toString(),
                              style: TextStyle(
                                fontFamily: 'Open-Sans',
                                fontSize: 20.0,
                                color: Colors.blue[900],
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
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
                              mainStore
                                  .userStore.user.friendCapsulesOpened.length
                                  .toString(),
                              style: TextStyle(
                                fontFamily: 'Open-Sans',
                                fontSize: 20.0,
                                color: Colors.blue[900],
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
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
                  height: height * 0.04,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyFriendsScreen()),
                    );
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'View Friends',
                            style: TextStyle(
                              fontFamily: 'Open_Sans',
                              fontSize: 16.0,
                            ),
                          ),
                          Container(
                            width: 50.0,
                            height: 40.0,
                            child: Icon(
                              Icons.chevron_right,
                              size: 35.0,
                            ),
                          ),
                        ],
                      ),
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddFriendsScreen()),
                    );
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Add A Friend',
                            style: TextStyle(
                              fontFamily: 'Open_Sans',
                              fontSize: 16.0,
                            ),
                          ),
                          Container(
                            width: 50.0,
                            height: 40.0,
                            child: Icon(
                              Icons.chevron_right,
                              size: 35.0,
                            ),
                          ),
                        ],
                      ),
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FriendRequestScreen()),
                    );
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Friend Requests',
                            style: TextStyle(
                              fontFamily: 'Open_Sans',
                              fontSize: 16.0,
                            ),
                          ),
                          Container(
                            width: 50.0,
                            height: 40.0,
                            child: Icon(
                              Icons.chevron_right,
                              size: 35.0,
                            ),
                          ),
                        ],
                      ),
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
                GestureDetector(
                  onTap: () {
                    AuthService.signOut();
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Log Out',
                            style: TextStyle(
                              fontFamily: 'Open_Sans',
                              fontSize: 16.0,
                            ),
                          ),
                          Container(
                            width: 50.0,
                            height: 40.0,
                            child: Icon(
                              Icons.chevron_right,
                              size: 35.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
