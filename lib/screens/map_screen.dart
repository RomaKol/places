import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import '../models/place.dart';
import '../constants.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;

  MapScreen({
    this.initialLocation =
        const PlaceLocation(latitude: 49.423717, longitude: 26.986303),
    this.isSelecting = false,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _pickedLocation;

  void _selectLocation(LatLng position) {
    setState(() {
      this._pickedLocation = position;
    });
  }

  List<Marker> _getMarkers() {
    final LatLng point = this._pickedLocation == null
        ? LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          )
        : this._pickedLocation;
    final List<Marker> markers = [];
    final Marker marker = Marker(
      point: point,
      width: 80.0,
      height: 80.0,
      builder: (ctx) => Container(
        child: Icon(
          Icons.person_pin_circle,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
    markers.add(marker);
    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        actions: <Widget>[
          if (widget.isSelecting)
            IconButton(
              icon: Icon(Icons.check),
              onPressed: this._pickedLocation == null
                  ? null
                  : () {
                      Navigator.of(context).pop(this._pickedLocation);
                    },
            ),
        ],
      ),
      body: FlutterMap(
        options: MapOptions(
          zoom: 15.0,
          center: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          interactive: true,
          onTap: widget.isSelecting ? this._selectLocation : null,
        ),
        layers: <LayerOptions>[
          TileLayerOptions(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/mapbox/dark-v10/tiles/256/{z}/{x}/{y}?title=true&access_token=${MAP_API_KEY}',
            additionalOptions: {
              'accessToken': MAP_SECRET_KEY,
              'id': 'mapbox.dark-v10',
            },
          ),
          MarkerLayerOptions(
            markers: (this._pickedLocation == null && widget.isSelecting)
                ? []
                : this._getMarkers(),
          ),
        ],
      ),
    );
  }
}
