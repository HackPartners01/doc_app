import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:doc_app/services/location.dart';
// import 'package:google_map_polyline/google_map_polyline.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapLiveLocation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MapLiveLocationState();
  }
}

class MapLiveLocationState extends State<MapLiveLocation> {
  double _latitude = 24.4745017;
  double _longitude = 82.987785;
  initState() {
    super.initState();
    // print(location.latitude);
    // _latitude = location.latitude;
    // _longitude = location.longitude;
  }

  @override
  Widget build(BuildContext context) {
    print(location.latitude);

    return FlutterMap(
      options: MapOptions(
          center: LatLng(_latitude, _longitude),
          minZoom: 10.0,
          zoom: 15.0,
          onTap: (LatLng l) {
            setState(() {
              _latitude = location.latitude;
              _longitude = location.longitude;
            });
          }),
      layers: [
        TileLayerOptions(
          urlTemplate:
              "https://api.mapbox.com/styles/v1/pseudocoders/ckhybp7rf0jg119mjjnm57ach/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicHNldWRvY29kZXJzIiwiYSI6ImNraHhxeXlkMTAwOHEycm8xOTQ5OWd6OGEifQ.qV8G8wpyAy5bShPvnw84qg",
          additionalOptions: {
            'accessToken':
                'sk.eyJ1IjoicHNldWRvY29kZXJzIiwiYSI6ImNraHk5eGMyZTA4ZW4ycm9hdXZjZ3FsYXkifQ.Meu9o15bvwY0Ht9BG7_T2w',
            'id': 'mapbox.mapbox-streets-v8'
          },
        ),
      ],
    );
  }
}
