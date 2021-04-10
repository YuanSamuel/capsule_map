import 'package:capsule_map/stores/capsulesStore/capsules_store.dart';
import 'package:capsule_map/stores/friendCapsulesOpenedStore/friend_capsules_opened_store.dart';
import 'package:capsule_map/stores/friendCapsulesStore/friend_capsules_store.dart';
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

  ReactionDisposer _dispose;

  void setupReactions() {
    _dispose = autorun((_) {
      print(currentUser.value);
      if (loggedIn) {
        userStore.setUpStream(currentUser.data.uid);
        if (userStore.user.capsules != null) {
          capsulesStore.setUpStream(userStore.user.capsules);
        }
        if (userStore.user.friendCapsules != null) {
          friendCapsulesStore.setUpStream(userStore.user.friendCapsules);
        }
        if (userStore.user.friendCapsulesOpened != null) {
          friendCapsulesOpenedStore
              .setUpStream(userStore.user.friendCapsulesOpened);
        }
      } else {
        userStore.stop();
        capsulesStore.stop();
        friendCapsulesStore.stop();
        friendCapsulesOpenedStore.stop();
      }
    });
  }

  @computed
  bool get loggedIn => currentUser.value != null;
}
