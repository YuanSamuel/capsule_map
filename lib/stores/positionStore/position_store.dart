import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'position_store.g.dart';

class PositionStore = _PositionStore with _$PositionStore;

abstract class _PositionStore with Store {
  @observable
  bool serviceEnabled = false;

  @observable
  LocationPermission permission = LocationPermission.denied;

  @computed
  bool get permissionAllowed =>
      serviceEnabled &&
      permission != LocationPermission.denied &&
      permission != LocationPermission.deniedForever;

  @computed
  ObservableStream<Position> get positionStream {
    if (permissionAllowed) {
      return Geolocator.getPositionStream().asObservable();
    } else {
      return null;
    }
  }

  @action
  Future<void> checkPermissions() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print('enabled');
    print(serviceEnabled);
    if (serviceEnabled) {
      permission = await Geolocator.checkPermission();
      print('permission');
      print(permission);
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
      }
    }
  }
}
