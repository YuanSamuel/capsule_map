import 'dart:async';

import 'package:capsule_map/stores/positionStore/position_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    PositionStore positionStore = Provider.of<PositionStore>(context);

    return Observer(builder: (_) {
      return positionStore.positionStream != null &&
              positionStore.positionStream.value != null
          ? Scaffold(
              body: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  positionStore.positionStream.value.latitude,
                  positionStore.positionStream.value.longitude,
                ),
                zoom: 12.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ))
          : Center(
              child: CircularProgressIndicator(),
            );
    });
  }
}
