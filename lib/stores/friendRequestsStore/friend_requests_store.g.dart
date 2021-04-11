// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_requests_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FriendRequestsStore on _FriendRequestsStore, Store {
  Computed<List<User>> _$friendRequestsComputed;

  @override
  List<User> get friendRequests => (_$friendRequestsComputed ??=
          Computed<List<User>>(() => super.friendRequests,
              name: '_FriendRequestsStore.friendRequests'))
      .value;
  Computed<bool> _$setUpComputed;

  @override
  bool get setUp => (_$setUpComputed ??=
          Computed<bool>(() => super.setUp, name: '_FriendRequestsStore.setUp'))
      .value;

  final _$friendRequestsStreamAtom =
      Atom(name: '_FriendRequestsStore.friendRequestsStream');

  @override
  ObservableStream<QuerySnapshot> get friendRequestsStream {
    _$friendRequestsStreamAtom.reportRead();
    return super.friendRequestsStream;
  }

  @override
  set friendRequestsStream(ObservableStream<QuerySnapshot> value) {
    _$friendRequestsStreamAtom.reportWrite(value, super.friendRequestsStream,
        () {
      super.friendRequestsStream = value;
    });
  }

  final _$_FriendRequestsStoreActionController =
      ActionController(name: '_FriendRequestsStore');

  @override
  void setUpStream(List<String> friendRequests) {
    final _$actionInfo = _$_FriendRequestsStoreActionController.startAction(
        name: '_FriendRequestsStore.setUpStream');
    try {
      return super.setUpStream(friendRequests);
    } finally {
      _$_FriendRequestsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stop() {
    final _$actionInfo = _$_FriendRequestsStoreActionController.startAction(
        name: '_FriendRequestsStore.stop');
    try {
      return super.stop();
    } finally {
      _$_FriendRequestsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
friendRequestsStream: ${friendRequestsStream},
friendRequests: ${friendRequests},
setUp: ${setUp}
    ''';
  }
}
