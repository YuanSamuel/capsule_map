import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:capsule_map/models/User.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @computed
  User get user {
    if (setUp) {
      print('got user');
      print(userStream.value);
      return User.fromSnapshot(userStream.value);
    } else {
      return null;
    }
  }

  @observable
  ObservableStream<DocumentSnapshot> userStream;

  @action
  void setUpStream(String uid) {
    print(uid);
    userStream = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .asObservable();
  }

  @action
  void stop() {
    userStream = null;
  }

  @computed
  bool get setUp => userStream != null && userStream.value != null;
}
