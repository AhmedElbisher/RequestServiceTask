import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapContainer extends StatelessWidget {
  final Position currentPosition;
  MapContainer({this.currentPosition});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        zoomControlsEnabled: false,
        markers: {
          Marker(
            markerId: MarkerId("user current location"),
            position:
                LatLng(currentPosition.latitude, currentPosition.longitude),
            icon: BitmapDescriptor.defaultMarker,
          )
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(currentPosition.latitude, currentPosition.longitude),
          // Provider.of<DataSource>(context).currentPosition.latitude,
          //Provider.of<DataSource>(context).currentPosition.longitude),
          zoom: 13.0,
        ),
      ),
    );
  }
}

//marker image

//todo  Future<BitmapDescriptor> _getImageFromAsset(String path) async {
//    ImageConfiguration imageConfiguration = ImageConfiguration();
//    var x = await BitmapDescriptor.fromAssetImage(imageConfiguration, path);
//    setState(() {
//      bitmapImage = x;
//    });
//    return bitmapImage;
//  }

//_getImageFromAsset("images/marker.png");
//var bitmapImage = null;
