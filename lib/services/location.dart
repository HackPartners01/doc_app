import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      print('Location Obtained');
    } catch (e) {
      print(e);
    }
  }
}

Location location =
    Location(); // Global variable, import location.dart file to use location
