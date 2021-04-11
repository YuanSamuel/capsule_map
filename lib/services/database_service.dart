import 'package:capsule_map/models/User.dart';
import 'package:capsule_map/stores/mainStore/main_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class DatabaseService {
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> removeFriend(User friend, BuildContext context) async {
    try {
      String friendId = friend.reference.id;

      MainStore mainStore = Provider.of<MainStore>(context, listen: false);

      User currentUser = mainStore.userStore.user;
      currentUser.friends
          .removeWhere((String givenFriendId) => givenFriendId == friendId);

      friend.friends
          .removeWhere((String userId) => userId == currentUser.reference.id);

      await currentUser.reference.update(currentUser.toJson());
      await friend.reference.update(friend.toJson());
    } catch (error) {
      print(error);
    }
  }

  static Future<void> acceptFriendRequest(
      User friend, BuildContext context) async {
    try {
      String friendId = friend.reference.id;

      MainStore mainStore = Provider.of<MainStore>(context, listen: false);

      User currentUser = mainStore.userStore.user;
      currentUser.friends.add(friendId);
      currentUser.friendRequests
          .removeWhere((String givenFriendId) => givenFriendId == friendId);

      friend.friends.add(currentUser.reference.id);
      friend.friendRequests
          .removeWhere((String userId) => userId == currentUser.reference.id);

      await currentUser.reference.update(currentUser.toJson());
      await friend.reference.update(friend.toJson());
    } catch (error) {
      print(error);
    }
  }

  static Future<void> declineFriendRequest(
      User friend, BuildContext context) async {
    try {
      String friendId = friend.reference.id;

      MainStore mainStore = Provider.of<MainStore>(context, listen: false);

      User currentUser = mainStore.userStore.user;
      currentUser.friendRequests
          .removeWhere((String givenFriendId) => givenFriendId == friendId);

      friend.friendRequests
          .removeWhere((String userId) => userId == currentUser.reference.id);

      await currentUser.reference.update(currentUser.toJson());
      await friend.reference.update(friend.toJson());
    } catch (error) {
      print(error);
    }
  }
}
