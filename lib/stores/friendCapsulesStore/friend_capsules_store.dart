import 'package:capsule_map/models/Capsule.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'friend_capsules_store.g.dart';

class FriendCapsulesStore = _FriendCapsulesStore with _$FriendCapsulesStore;

abstract class _FriendCapsulesStore with Store {
  @computed
  List<Capsule> get friendCapsules {
    if (setUp) {
      List<Capsule> capsules = <Capsule>[];
      capsulesStream.value.docs.forEach((DocumentSnapshot snapshot) {
        capsules.add(Capsule.fromSnapshot(snapshot));
      });
      return capsules;
    } else {
      return null;
    }
  }

  @observable
  ObservableStream<QuerySnapshot> capsulesStream;

  @action
  void setUpStream(List<String> capsules) {
    capsulesStream = FirebaseFirestore.instance
        .collection('capsules')
        .where(FieldPath.documentId, whereIn: capsules)
        .snapshots()
        .asObservable();
  }

  @action
  void stop() {
    capsulesStream = null;
  }

  @computed
  bool get setUp => capsulesStream != null && capsulesStream.value != null;
}
