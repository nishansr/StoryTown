import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(-33.86, 151.20),
          zoom: 11.0,
        ),
        markers: {
          const Marker(
            markerId: MarkerId('Sydney'),
            position: LatLng(-33.86, 151.20),
          ),
        },
      ),
    );
  }
}
