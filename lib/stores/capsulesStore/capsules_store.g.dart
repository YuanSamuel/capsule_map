// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capsules_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CapsulesStore on _CapsulesStore, Store {
  Computed<List<Capsule>> _$capsulesComputed;

  @override
  List<Capsule> get capsules =>
      (_$capsulesComputed ??= Computed<List<Capsule>>(() => super.capsules,
              name: '_CapsulesStore.capsules'))
          .value;
  Computed<bool> _$setUpComputed;

  @override
  bool get setUp => (_$setUpComputed ??=
          Computed<bool>(() => super.setUp, name: '_CapsulesStore.setUp'))
      .value;

  final _$capsulesStreamAtom = Atom(name: '_CapsulesStore.capsulesStream');

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

  final _$_CapsulesStoreActionController =
      ActionController(name: '_CapsulesStore');

  @override
  void setUpStream(List<String> capsules) {
    final _$actionInfo = _$_CapsulesStoreActionController.startAction(
        name: '_CapsulesStore.setUpStream');
    try {
      return super.setUpStream(capsules);
    } finally {
      _$_CapsulesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stop() {
    final _$actionInfo = _$_CapsulesStoreActionController.startAction(
        name: '_CapsulesStore.stop');
    try {
      return super.stop();
    } finally {
      _$_CapsulesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
capsulesStream: ${capsulesStream},
capsules: ${capsules},
setUp: ${setUp}
    ''';
  }
}
