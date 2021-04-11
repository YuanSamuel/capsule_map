// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PositionStore on _PositionStore, Store {
  Computed<bool> _$permissionAllowedComputed;

  @override
  bool get permissionAllowed => (_$permissionAllowedComputed ??= Computed<bool>(
          () => super.permissionAllowed,
          name: '_PositionStore.permissionAllowed'))
      .value;
  Computed<ObservableStream<Position>> _$positionStreamComputed;

  @override
  ObservableStream<Position> get positionStream => (_$positionStreamComputed ??=
          Computed<ObservableStream<Position>>(() => super.positionStream,
              name: '_PositionStore.positionStream'))
      .value;

  final _$serviceEnabledAtom = Atom(name: '_PositionStore.serviceEnabled');

  @override
  bool get serviceEnabled {
    _$serviceEnabledAtom.reportRead();
    return super.serviceEnabled;
  }

  @override
  set serviceEnabled(bool value) {
    _$serviceEnabledAtom.reportWrite(value, super.serviceEnabled, () {
      super.serviceEnabled = value;
    });
  }

  final _$permissionAtom = Atom(name: '_PositionStore.permission');

  @override
  LocationPermission get permission {
    _$permissionAtom.reportRead();
    return super.permission;
  }

  @override
  set permission(LocationPermission value) {
    _$permissionAtom.reportWrite(value, super.permission, () {
      super.permission = value;
    });
  }

  final _$checkPermissionsAsyncAction =
      AsyncAction('_PositionStore.checkPermissions');

  @override
  Future<void> checkPermissions() {
    return _$checkPermissionsAsyncAction.run(() => super.checkPermissions());
  }

  @override
  String toString() {
    return '''
serviceEnabled: ${serviceEnabled},
permission: ${permission},
permissionAllowed: ${permissionAllowed},
positionStream: ${positionStream}
    ''';
  }
}
