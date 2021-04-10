import 'package:geolocator/geolocator.dart';

class LocationHelper {
  static bool closeToMarker(
      double latA, double longA, double latB, double longB) {
    return Geolocator.distanceBetween(latA, longA, latB, longB) < 50;
  }
}
