import 'dart:async';

import 'package:doc_app/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
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
  final Set<Polyline> polyLine = {};
  List<LatLng> routeCoords;
  LatLng ourLocation = LatLng(27.2046, 77.4977);
  LatLng docLocation = LatLng(24.4628, 82.9930);

  getSomePoints() async {

      routeCoords = await googleMapPolyline.getCoordinatesWithLocation(
          origin: docLocation,
          destination: ourLocation,
          mode: RouteMode.driving);
    }
  }

  void initState() {
    super.initState();
    getSomePoints();

    polyLine.add(Polyline(
      polylineId: PolylineId('route1'),
      visible: true,
      points: routeCoords,
      width: 4,
      color: kColorOrange,
      startCap: Cap.roundCap,
      endCap: Cap.buttCap,
    ));
  }

  GoogleMapPolyline googleMapPolyline =
      new GoogleMapPolyline(apiKey: 'AIzaSyA-wTfmpUdurLBGrJBjOgrAgm1N5cpUcXI');

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
                initialCameraPosition:
                CameraPosition(target: _center, zoom: 11),
                mapType: _currentMapType,
                markers: markers,
                polylines: polyLine,
                onCameraMove: _onCameraMove,
              ),
            ],
          ),
        )
    );
  }
}
