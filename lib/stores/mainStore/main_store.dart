import 'package:capsule_map/stores/capsulesStore/capsules_store.dart';
import 'package:capsule_map/stores/friendCapsulesOpenedStore/friend_capsules_opened_store.dart';
import 'package:capsule_map/stores/friendCapsulesStore/friend_capsules_store.dart';
import 'package:capsule_map/stores/friendRequestsStore/friend_requests_store.dart';
import 'package:capsule_map/stores/friendsStore/friends_store.dart';
import 'package:capsule_map/stores/userStore/user_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  @observable
  ObservableStream<User> currentUser =
      FirebaseAuth.instance.userChanges().asObservable();

  @observable
  UserStore userStore = UserStore();

  @observable
  CapsulesStore capsulesStore = CapsulesStore();

  @observable
  FriendCapsulesStore friendCapsulesStore = FriendCapsulesStore();

  @observable
  FriendCapsulesOpenedStore friendCapsulesOpenedStore =
      FriendCapsulesOpenedStore();

  @observable
  FriendsStore friendsStore = FriendsStore();

  @observable
  FriendRequestsStore friendRequestsStore = FriendRequestsStore();

  ReactionDisposer _dispose;

  void setupReactions() {
    _dispose = autorun((_) {
      print('run');
      print(currentUser.value);
      if (loggedIn) {
        if (userStore.userStream == null) {
          userStore.setUpStream(currentUser.data.uid);
        }
        if (userStore.user.capsules != null &&
            userStore.user.capsules.isNotEmpty) {
          capsulesStore.setUpStream(userStore.user.capsules);
        } else {
          capsulesStore.stop();
        }
        if (userStore.user.friendCapsules != null &&
            userStore.user.friendCapsules.isNotEmpty) {
          friendCapsulesStore.setUpStream(userStore.user.friendCapsules);
        } else {
          friendCapsulesStore.stop();
        }
        if (userStore.user.friendCapsulesOpened != null &&
            userStore.user.friendCapsulesOpened.isNotEmpty) {
          friendCapsulesOpenedStore
              .setUpStream(userStore.user.friendCapsulesOpened);
        } else {
          friendCapsulesOpenedStore.stop();
        }
        if (userStore.user.friends != null &&
            userStore.user.friends.isNotEmpty) {
          friendsStore.setUpStream(userStore.user.friends);
        } else {
          friendsStore.stop();
        }
        if (userStore.user.friendRequests != null &&
            userStore.user.friendRequests.isNotEmpty) {
          friendRequestsStore.setUpStream(userStore.user.friendRequests);
        } else {
          friendRequestsStore.stop();
        }
      } else {
        userStore.stop();
        capsulesStore.stop();
        friendCapsulesStore.stop();
        friendCapsulesOpenedStore.stop();
        friendsStore.stop();
        friendRequestsStore.stop();
      }
    });
  }

  @computed
  bool get loggedIn => currentUser.value != null;
}
