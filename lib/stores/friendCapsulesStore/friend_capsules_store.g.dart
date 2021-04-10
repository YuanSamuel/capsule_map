// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_capsules_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FriendCapsulesStore on _FriendCapsulesStore, Store {
  Computed<List<Capsule>> _$friendCapsulesComputed;

  @override
  List<Capsule> get friendCapsules => (_$friendCapsulesComputed ??=
          Computed<List<Capsule>>(() => super.friendCapsules,
              name: '_FriendCapsulesStore.friendCapsules'))
      .value;
  Computed<bool> _$setUpComputed;

  @override
  bool get setUp => (_$setUpComputed ??=
          Computed<bool>(() => super.setUp, name: '_FriendCapsulesStore.setUp'))
      .value;

  final _$capsulesStreamAtom =
      Atom(name: '_FriendCapsulesStore.capsulesStream');

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

  final _$_FriendCapsulesStoreActionController =
      ActionController(name: '_FriendCapsulesStore');

  @override
  void setUpStream(List<String> capsules) {
    final _$actionInfo = _$_FriendCapsulesStoreActionController.startAction(
        name: '_FriendCapsulesStore.setUpStream');
    try {
      return super.setUpStream(capsules);
    } finally {
      _$_FriendCapsulesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stop() {
    final _$actionInfo = _$_FriendCapsulesStoreActionController.startAction(
        name: '_FriendCapsulesStore.stop');
    try {
      return super.stop();
    } finally {
      _$_FriendCapsulesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
capsulesStream: ${capsulesStream},
friendCapsules: ${friendCapsules},
setUp: ${setUp}
    ''';
  }
}
