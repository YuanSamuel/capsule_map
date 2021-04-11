import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapCapsule extends StatefulWidget {
  @override
  _MapCapsuleState createState() => _MapCapsuleState();
}

class _MapCapsuleState extends State<MapCapsule> {
  get markers => null;

// ignore: unused_element
  void _updatePosition(CameraPosition _position) {
    Position newMarkerPosition = Position(
        latitude: _position.target.latitude,
        longitude: _position.target.longitude);
    Marker marker = markers["1"];

    setState(() {
      markers["1"] = marker.copyWith(
          positionParam:
              LatLng(newMarkerPosition.latitude, newMarkerPosition.longitude));
    });
  }

  @override
  Widget build(BuildContext context) {
    var value;
    int _selectedIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Capsule Map'),
      ),
      body: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition:
              CameraPosition(target: LatLng(37.71124, -121.87365), zoom: 7),
          markers: Set<Marker>.of(<Marker>[
            Marker(
                onTap: () {
                  print('Tapped');
                },
                draggable: true,
                markerId: MarkerId('Marker'),
                position: LatLng(value.latitude, value.longitude),
                onDragEnd: ((newPosition) {
                  print(newPosition.latitude);
                  print(newPosition.longitude);
                }))
          ])),
    );
  }
}
