// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FriendsStore on _FriendsStore, Store {
  Computed<List<User>> _$friendsComputed;

  @override
  List<User> get friends =>
      (_$friendsComputed ??= Computed<List<User>>(() => super.friends,
              name: '_FriendsStore.friends'))
          .value;
  Computed<bool> _$setUpComputed;

  @override
  bool get setUp => (_$setUpComputed ??=
          Computed<bool>(() => super.setUp, name: '_FriendsStore.setUp'))
      .value;

  final _$friendsStreamAtom = Atom(name: '_FriendsStore.friendsStream');

  @override
  ObservableStream<QuerySnapshot> get friendsStream {
    _$friendsStreamAtom.reportRead();
    return super.friendsStream;
  }

  @override
  set friendsStream(ObservableStream<QuerySnapshot> value) {
    _$friendsStreamAtom.reportWrite(value, super.friendsStream, () {
      super.friendsStream = value;
    });
  }

  final _$_FriendsStoreActionController =
      ActionController(name: '_FriendsStore');

  @override
  void setUpStream(List<String> friends) {
    final _$actionInfo = _$_FriendsStoreActionController.startAction(
        name: '_FriendsStore.setUpStream');
    try {
      return super.setUpStream(friends);
    } finally {
      _$_FriendsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stop() {
    final _$actionInfo =
        _$_FriendsStoreActionController.startAction(name: '_FriendsStore.stop');
    try {
      return super.stop();
    } finally {
      _$_FriendsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
friendsStream: ${friendsStream},
friends: ${friends},
setUp: ${setUp}
    ''';
  }
}
