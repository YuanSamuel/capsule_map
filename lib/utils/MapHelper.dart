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
                            color: Colors.white),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(capsule.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0,
                                )),
                            SizedBox(
                              height: 3.0,
                            ),
                            Text(
                                capsule.username +
                                    ' - ' +
                                    StringHelper.dateToString(capsule.created),
                                style: TextStyle(fontStyle: FontStyle.italic)),
                            Divider(height: 25),
                            Container(
                              padding: EdgeInsets.only(left: 30.0, right: 30),
                              child: Text(capsule.description,
                                  style: TextStyle(fontSize: 16.0, height: 1.5)),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: capsule.imageUrls.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: EdgeInsets.all(10.0),
                                  child: CachedNetworkImage(
                                    imageUrl: capsule.imageUrls[index],
                                  ),
                                );
                              },
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: capsule.videoUrls.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: VideoPlayerWidget(
                                    videoUrl: capsule.videoUrls[index],
                                  ),
                                );
                              },
                            ),
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
