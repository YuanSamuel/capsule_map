// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  Computed<User> _$userComputed;

  @override
  User get user => (_$userComputed ??=
          Computed<User>(() => super.user, name: '_UserStore.user'))
      .value;
  Computed<bool> _$setUpComputed;

  @override
  bool get setUp => (_$setUpComputed ??=
          Computed<bool>(() => super.setUp, name: '_UserStore.setUp'))
      .value;

  final _$userStreamAtom = Atom(name: '_UserStore.userStream');

  @override
  ObservableStream<DocumentSnapshot> get userStream {
    _$userStreamAtom.reportRead();
    return super.userStream;
  }

  @override
  set userStream(ObservableStream<DocumentSnapshot> value) {
    _$userStreamAtom.reportWrite(value, super.userStream, () {
      super.userStream = value;
    });
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  void setUpStream(String uid) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setUpStream');
    try {
      return super.setUpStream(uid);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stop() {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.stop');
    try {
      return super.stop();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userStream: ${userStream},
user: ${user},
setUp: ${setUp}
    ''';
  }
}
