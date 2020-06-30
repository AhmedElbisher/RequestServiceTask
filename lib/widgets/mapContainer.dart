import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/DataSource.dart';

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
        markers: Provider.of<DataSource>(context).markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(currentPosition.latitude, currentPosition.longitude),
          // Provider.of<DataSource>(context).currentPosition.latitude,
          //Provider.of<DataSource>(context).currentPosition.longitude),
          zoom: 16.0,
        ),
      ),
    );
  }
}

//marker image
//    ImageConfiguration imageConfiguration = ImageConfiguration();
//    var x = await BitmapDescriptor.fromAssetImage(imageConfiguration, path);
//    setState(() {
//      bitmapImage = x;
//    });
//    return bitmapImage;
//  }

//_getImageFromAsset("images/marker.png");
//var bitmapImage = null;
