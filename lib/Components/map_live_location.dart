import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapLiveLocation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MapLiveLocationState();
  }
}

class MapLiveLocationState extends State<MapLiveLocation> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(45.521, -122.677);
  final Set<Marker> markers = {};
  MapType _currentMapType = MapType.normal;
  LatLng _lastMapPosition = _center;

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _center, zoom: 11),
            mapType: _currentMapType,
            markers: markers,
            onCameraMove: _onCameraMove,
          ),
        ],
      ),
    ));
  }
}
