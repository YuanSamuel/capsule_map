import 'package:capsule_map/screens/profile/friend_widget.dart';
import 'package:capsule_map/stores/mainStore/main_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MyFriendsScreen extends StatefulWidget {
  @override
  _MyFriendsScreenState createState() => _MyFriendsScreenState();
}

class _MyFriendsScreenState extends State<MyFriendsScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    MainStore mainStore = Provider.of<MainStore>(context);

    return Observer(
      builder: (_) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'My Friends',
              style: TextStyle(
                color: Colors.blueAccent,
              ),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: ListView.builder(
                itemCount: mainStore.friendsStore.friends != null ? mainStore.friendsStore.friends.length : 0,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      FriendWidget(
                        friend: mainStore.friendsStore.friends[index],
                      ),
                      SizedBox(height: 15),
                      Divider(
                        height: 20,
                        thickness: 1,
                        color: Colors.black,
                      ),
                    ],
                  );
                },
              ),
            ),
          )),
    );
  }
}
