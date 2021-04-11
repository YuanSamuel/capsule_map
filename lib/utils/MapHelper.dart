import 'package:capsule_map/models/Capsule.dart';
import 'package:capsule_map/stores/positionStore/position_store.dart';
import 'package:capsule_map/utils/LocationHelper.dart';
import 'package:capsule_map/utils/StringHelper.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapHelper {
  static Set<Marker> getMarkers(BuildContext context, List<Capsule> capsules, BitmapDescriptor currentLocationDot) {
    PositionStore positionStore =
        Provider.of<PositionStore>(context, listen: false);

    double height = MediaQuery.of(context).size.height;

    if (positionStore.positionStream != null &&
        positionStore.positionStream.value != null) {
      List<Marker> markers = <Marker>[];

      double currentLat = positionStore.positionStream.value.latitude;
      double currentLong = positionStore.positionStream.value.longitude;
      capsules.forEach((Capsule capsule) {
        bool close = LocationHelper.closeToMarker(currentLat, currentLong,
            capsule.location.latitude, capsule.location.longitude);

        if (close) {
          markers.add(
            Marker(
              markerId: MarkerId(capsule.reference.id),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
              onTap: () async {
                await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Container(
                      height: height * 0.7,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                          color: Colors.white
                        ),
                        child: Column(
                          children: [
                            Text(capsule.title),
                            Text(capsule.username +
                                ' - ' +
                                StringHelper.dateToString(capsule.created)),
                            Text(capsule.description),
                          ],
                        ),
                      ),
                    );
                  },
                );
                //TODO: Uncomment this for the marker to go away after exiting
                //DatabaseService.openCapsule(capsule, context);
              },
              position:
                  LatLng(capsule.location.latitude, capsule.location.longitude),
            ),
          );
        } else {
          markers.add(
            Marker(
              markerId: MarkerId(capsule.reference.id),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueCyan),
              infoWindow: InfoWindow(
                title: capsule.title,
                snippet: capsule.username +
                    ' - ' +
                    StringHelper.dateToString(capsule.created),
              ),
              position:
                  LatLng(capsule.location.latitude, capsule.location.longitude),
            ),
          );
        }
      });

      markers.add(Marker(
        markerId: MarkerId('Current Location'),
        icon: currentLocationDot,
        position: LatLng(currentLat, currentLong),
      ));

      return markers.toSet();
    }

    return new Set();
  }
}
