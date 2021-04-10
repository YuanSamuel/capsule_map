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

  ReactionDisposer _dispose;

  void setupReactions() {
    _dispose = autorun((_) {
      if (loggedIn) {
        userStore.setUpStream(currentUser.data.uid);
      } else {
        userStore.stop();
      }
    });
  }

  @computed
  bool get loggedIn => currentUser.data != null;
}
