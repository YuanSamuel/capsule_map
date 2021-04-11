import 'package:capsule_map/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'friend_requests_store.g.dart';

class FriendRequestsStore = _FriendRequestsStore with _$FriendRequestsStore;

abstract class _FriendRequestsStore with Store {
  @computed
  List<User> get friendRequests {
    if (setUp) {
      List<User> friendRequests = <User>[];
      friendRequestsStream.value.docs.forEach((DocumentSnapshot snapshot) {
        print(snapshot.data());
        friendRequests.add(User.fromSnapshot(snapshot));
      });
      return friendRequests;
    } else {
      return null;
    }
  }

  @observable
  ObservableStream<QuerySnapshot> friendRequestsStream;

  @action
  void setUpStream(List<String> friendRequests) {
    friendRequestsStream = FirebaseFirestore.instance
        .collection('users')
        .where(FieldPath.documentId, whereIn: friendRequests)
        .snapshots()
        .asObservable();
  }

  @action
  void stop() {
    friendRequestsStream = null;
  }

  @computed
  bool get setUp =>
      friendRequestsStream != null && friendRequestsStream.value != null;
}
