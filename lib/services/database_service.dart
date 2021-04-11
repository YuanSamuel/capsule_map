import 'package:capsule_map/models/Capsule.dart';
import 'package:capsule_map/models/User.dart';
import 'package:capsule_map/stores/mainStore/main_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
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

  static Future<void> sendFriendRequest(
      String username, BuildContext context) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .get();
      if (snapshot.size > 0) {
        for (int i = 0; i < snapshot.size; i++) {
          MainStore mainStore = Provider.of<MainStore>(context, listen: false);

          auth.User currentUser = mainStore.currentUser.value;
          await snapshot.docs[i].reference.update({
            'friendRequests': FieldValue.arrayUnion([currentUser.uid])
          });
        }
      }
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

  static Future<void> openCapsule(Capsule capsule, BuildContext context) async {
    MainStore mainStore = Provider.of<MainStore>(context, listen: false);

    User currentUser = mainStore.userStore.user;
    currentUser.friendCapsules
        .removeWhere((String capsuleId) => capsuleId == capsule.reference.id);

    currentUser.friendCapsulesOpened.add(capsule.reference.id);
    await currentUser.reference.update(currentUser.toJson());
  }

  static Future<String> createCapsule(
      Capsule capsule, BuildContext context) async {
    MainStore mainStore = Provider.of<MainStore>(context, listen: false);

    User currentUser = mainStore.userStore.user;

    capsule.username = currentUser.username;

    DocumentReference addedCapsule =
        await _firestore.collection('capsules').add(capsule.toJson());

    currentUser.capsules.add(addedCapsule.id);
    await currentUser.reference.update(currentUser.toJson());

    return addedCapsule.id;
  }

  static Future<void> shareCapsule(
      String capsuleId, List<String> friendIds) async {
    List<Future<void>> updateDocumentFutures = <Future<void>>[];
    for (int i = 0; i < friendIds.length; i++) {
      updateDocumentFutures
          .add(_firestore.collection('users').doc(friendIds[i]).update({
        'friendCapsules': FieldValue.arrayUnion([capsuleId]),
      }));
    }
    await Future.wait(updateDocumentFutures);
  }

  static Future<void> updateProfileUrl(String url, BuildContext context) async {
    MainStore mainStore = Provider.of<MainStore>(context, listen: false);

    User currentUser = mainStore.userStore.user;

    currentUser.profileUrl = url;
    currentUser.reference.set(currentUser.toJson());
  }
}
