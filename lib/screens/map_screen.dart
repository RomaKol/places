import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../models/place.dart';
import '../constants.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;

  MapScreen({
    this.initialLocation =
        // const PlaceLocation(latitude: 47.833793, longitude: 38.500626),
        const PlaceLocation(latitude: 49.423717, longitude: 26.986303),
    this.isSelecting = false,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _pickedLocation;

  void _selectLocation(Point<double> point, LatLng position) {
    setState(() {
      this._pickedLocation = position;
    });
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
              onPressed: this._pickedLocation == null ? null : () {
                Navigator.of(context).pop(this._pickedLocation);
              },
            ),
        ],
      ),
      body: MapboxMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 16,
        ),
        onMapClick: widget.isSelecting ? this._selectLocation : null,
        accessToken: MAP_SECRET_KEY,
      ),
    );
  }
}
