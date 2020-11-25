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
  LatLng ourLocation = LatLng(29.318692, 76.307506);
  LatLng docLocation = LatLng(29.291125, 76.338386);
  GoogleMapController _controller;
  final Set<Polyline> polyLine = {};
  List<LatLng> routeCoords = [];
  GoogleMapPolyline googleMapPolyline =
      new GoogleMapPolyline(apiKey: 'AIzaSyChQl1UFDjDPO3jdUtvV_eFVZbJKFOtV8s');

  initState() {
    super.initState();
    getSomePoints();
  }

  getSomePoints() async {
    routeCoords = await googleMapPolyline.getCoordinatesWithLocation(
        origin: docLocation, destination: ourLocation, mode: RouteMode.driving);

    print('$routeCoords and helooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: onMapCreated,
        polylines: polyLine,
        initialCameraPosition: CameraPosition(target: ourLocation, zoom: 14),
      ),
    );
  }

  onMapCreated(GoogleMapController googleMapController) {
    setState(() {
      _controller = googleMapController;
      polyLine.add(Polyline(polylineId: PolylineId('route1'), visible: true,width: 4, color: kColorOrange, points: routeCoords, startCap: Cap.roundCap, endCap: Cap.buttCap));
    });
  }
}
