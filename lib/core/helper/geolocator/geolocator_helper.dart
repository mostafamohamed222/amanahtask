import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class GeolocatorHelper {
  GeolocatorHelper();
  LatLng? currentLocation;

  Future<LatLng?> getMyCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      Position currentPosition = await Geolocator.getCurrentPosition();
      currentLocation =
          LatLng(currentPosition.latitude, currentPosition.longitude);

      print(
          "the lat is ${currentPosition.latitude} and long is ${currentPosition.longitude}");
      return LatLng(currentPosition.latitude, currentPosition.longitude);
    }

    return null;
  }

  Future openLocationOnMap(double lat , double long) async {
    await MapsLauncher.launchCoordinates(lat, long);
  }
}
