import 'package:capsule_map/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'friends_store.g.dart';

class FriendsStore = _FriendsStore with _$FriendsStore;

abstract class _FriendsStore with Store {
  @computed
  List<User> get friends {
    if (setUp) {
      List<User> friends = <User>[];
      friendsStream.value.docs.forEach((DocumentSnapshot snapshot) {
        print(snapshot.data());
        friends.add(User.fromSnapshot(snapshot));
      });
      return friends;
    } else {
      return null;
    }
  }

  @observable
  ObservableStream<QuerySnapshot> friendsStream;

  @action
  void setUpStream(List<String> friends) {
    friendsStream = FirebaseFirestore.instance
        .collection('users')
        .where(FieldPath.documentId, whereIn: friends)
        .snapshots()
        .asObservable();
  }

  @action
  void stop() {
    friendsStream = null;
  }

  @computed
  bool get setUp => friendsStream != null && friendsStream.value != null;
}
