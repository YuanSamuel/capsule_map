import 'dart:async';

import 'package:capsule_map/stores/mainStore/main_store.dart';
import 'package:capsule_map/stores/positionStore/position_store.dart';
import 'package:capsule_map/utils/MapHelper.dart';
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
    MainStore mainStore = Provider.of<MainStore>(context);
    PositionStore positionStore = Provider.of<PositionStore>(context);

    return FutureBuilder(
      future: BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: Size(12, 12)),
          'images/current_location_dot.png'),
      builder:
          (BuildContext context, AsyncSnapshot<BitmapDescriptor> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Observer(builder: (_) {
            return positionStore.positionStream != null &&
                    positionStore.positionStream.value != null
                ? Scaffold(
                    body: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    child: Theme(
                      data: ThemeData(
                        canvasColor: Colors.transparent,
                      ),
                      child: GoogleMap(
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
                        markers: MapHelper.getMarkers(
                            context,
                            mainStore.friendCapsulesStore.friendCapsules ?? [],
                            snapshot.data),
                      ),
                    ),
                  ))
                : Center(
                    child: CircularProgressIndicator(),
                  );
          });
        }
      },
    );
  }
}
