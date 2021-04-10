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

  @override
  String toString() {
    return '''
currentUser: ${currentUser},
userStore: ${userStore},
capsulesStore: ${capsulesStore},
loggedIn: ${loggedIn}
    ''';
  }
}
