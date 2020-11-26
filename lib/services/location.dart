import 'dart:async';

import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 24.4745017;
  double longitude = 82.987785;

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

  void keepGettingCurrentLocation() async {
    Duration thirtySeconds = Duration(seconds: 30);
    Geolocator.getPositionStream(
      intervalDuration: thirtySeconds,
      desiredAccuracy: LocationAccuracy.bestForNavigation,
    ).listen((Position position) {
      print(position == null
          ? 'Unknown'
          : position.latitude.toString() +
              ', ' +
              position.longitude.toString());
      // if(position == null)
      //   print('Position Null');
      // else {
      //   this.latitude = position.latitude;
      //   this.longitude = position.longitude;
      // }
    });
  }
}

Location location =
    Location(); // Global variable, import location.dart file to use location
