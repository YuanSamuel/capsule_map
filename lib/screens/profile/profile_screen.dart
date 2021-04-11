import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:capsule_map/screens/profile/addfriends_screen.dart';
import 'package:capsule_map/screens/profile/friendrequest_screen.dart';
import 'package:capsule_map/screens/profile/myfriends_screen.dart';
import 'package:capsule_map/services/auth_service.dart';
import 'package:capsule_map/services/database_service.dart';
import 'package:capsule_map/services/firebase_storage_service.dart';
import 'package:capsule_map/stores/mainStore/main_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    MainStore mainStore = Provider.of<MainStore>(context);

    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: Colors.white,//Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                  child: Center(
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        color: Color(0xFF030D56),
                        fontFamily: 'Open_Sans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 5.0,
                  thickness: 2.0,
                  color: Color(0xFF58A2E4),
                  indent: 120.0,
                  endIndent: 120.0,
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                GestureDetector(
                  onTap: () async {
                    ImageSource imageSource = await showDialog<ImageSource>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: height * 0.4,
                            width: width * 0.8,
                            child: SimpleDialog(
                              title: Text('Choose an Image'),
                              children: [
                                ListTile(
                                  leading: Icon(Icons.camera_alt_outlined),
                                  title: Text('Camera'),
                                  onTap: () {
                                    Navigator.pop(context, ImageSource.camera);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.photo),
                                  title: Text('Gallery'),
                                  onTap: () {
                                    Navigator.pop(context, ImageSource.gallery);
                                  },
                                ),
                              ],
                            ),
                          );
                        });
                    if (imageSource != null) {
                      PickedFile image =
                          await ImagePicker().getImage(source: imageSource);
                      if (image != null) {
                        String url =
                            await FirebaseStorageService.uploadProfileUrl(
                                File(image.path));
                        DatabaseService.updateProfileUrl(url, context);
                      }
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 5,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 90.0,
                      backgroundImage:
                          mainStore.userStore.user.profileUrl != null &&
                                  mainStore.userStore.user.profileUrl.isNotEmpty
                              ? CachedNetworkImageProvider(
                                  mainStore.userStore.user.profileUrl)
                              : AssetImage('images/dog.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                  child: Center(
                    child: Text(
                      mainStore.userStore.user.username,
                      style: TextStyle(
                        fontFamily: 'Open_Sans',
                        fontSize: 26.0,
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
                                color: Color(0xFF030D56),
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
                                color: Color(0xFF030D56),
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
                              fontWeight: FontWeight.w500,
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
                  color: Color(0xFF030D56),
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
                  color: Color(0xFF030D56),
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
                  color: Color(0xFF030D56),
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
