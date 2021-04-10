// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainStore on _MainStore, Store {
  Computed<bool> _$loggedInComputed;

  @override
  bool get loggedIn => (_$loggedInComputed ??=
          Computed<bool>(() => super.loggedIn, name: '_MainStore.loggedIn'))
      .value;

  final _$currentUserAtom = Atom(name: '_MainStore.currentUser');

  @override
  ObservableStream<User> get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(ObservableStream<User> value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  final _$userStoreAtom = Atom(name: '_MainStore.userStore');

  @override
  UserStore get userStore {
    _$userStoreAtom.reportRead();
    return super.userStore;
  }

  @override
  set userStore(UserStore value) {
    _$userStoreAtom.reportWrite(value, super.userStore, () {
      super.userStore = value;
    });
  }

  final _$capsulesStoreAtom = Atom(name: '_MainStore.capsulesStore');

  @override
  CapsulesStore get capsulesStore {
    _$capsulesStoreAtom.reportRead();
    return super.capsulesStore;
  }

  @override
  set capsulesStore(CapsulesStore value) {
    _$capsulesStoreAtom.reportWrite(value, super.capsulesStore, () {
      super.capsulesStore = value;
    });
  }

  final _$friendCapsulesStoreAtom =
      Atom(name: '_MainStore.friendCapsulesStore');

  @override
  FriendCapsulesStore get friendCapsulesStore {
    _$friendCapsulesStoreAtom.reportRead();
    return super.friendCapsulesStore;
  }

  @override
  set friendCapsulesStore(FriendCapsulesStore value) {
    _$friendCapsulesStoreAtom.reportWrite(value, super.friendCapsulesStore, () {
      super.friendCapsulesStore = value;
    });
  }

  final _$friendCapsulesOpenedStoreAtom =
      Atom(name: '_MainStore.friendCapsulesOpenedStore');

  @override
  FriendCapsulesOpenedStore get friendCapsulesOpenedStore {
    _$friendCapsulesOpenedStoreAtom.reportRead();
    return super.friendCapsulesOpenedStore;
  }

  @override
  set friendCapsulesOpenedStore(FriendCapsulesOpenedStore value) {
    _$friendCapsulesOpenedStoreAtom
        .reportWrite(value, super.friendCapsulesOpenedStore, () {
      super.friendCapsulesOpenedStore = value;
    });
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser},
userStore: ${userStore},
capsulesStore: ${capsulesStore},
friendCapsulesStore: ${friendCapsulesStore},
friendCapsulesOpenedStore: ${friendCapsulesOpenedStore},
loggedIn: ${loggedIn}
    ''';
  }
}
