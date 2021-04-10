// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_capsules_opened_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FriendCapsulesOpenedStore on _FriendCapsulesOpenedStore, Store {
  Computed<List<Capsule>> _$friendCapsulesOpenedComputed;

  @override
  List<Capsule> get friendCapsulesOpened => (_$friendCapsulesOpenedComputed ??=
          Computed<List<Capsule>>(() => super.friendCapsulesOpened,
              name: '_FriendCapsulesOpenedStore.friendCapsulesOpened'))
      .value;
  Computed<bool> _$setUpComputed;

  @override
  bool get setUp => (_$setUpComputed ??= Computed<bool>(() => super.setUp,
          name: '_FriendCapsulesOpenedStore.setUp'))
      .value;

  final _$capsulesStreamAtom =
      Atom(name: '_FriendCapsulesOpenedStore.capsulesStream');

  @override
  ObservableStream<QuerySnapshot> get capsulesStream {
    _$capsulesStreamAtom.reportRead();
    return super.capsulesStream;
  }

  @override
  set capsulesStream(ObservableStream<QuerySnapshot> value) {
    _$capsulesStreamAtom.reportWrite(value, super.capsulesStream, () {
      super.capsulesStream = value;
    });
  }

  final _$_FriendCapsulesOpenedStoreActionController =
      ActionController(name: '_FriendCapsulesOpenedStore');

  @override
  void setUpStream(List<String> capsules) {
    final _$actionInfo = _$_FriendCapsulesOpenedStoreActionController
        .startAction(name: '_FriendCapsulesOpenedStore.setUpStream');
    try {
      return super.setUpStream(capsules);
    } finally {
      _$_FriendCapsulesOpenedStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stop() {
    final _$actionInfo = _$_FriendCapsulesOpenedStoreActionController
        .startAction(name: '_FriendCapsulesOpenedStore.stop');
    try {
      return super.stop();
    } finally {
      _$_FriendCapsulesOpenedStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
capsulesStream: ${capsulesStream},
friendCapsulesOpened: ${friendCapsulesOpened},
setUp: ${setUp}
    ''';
  }
}
