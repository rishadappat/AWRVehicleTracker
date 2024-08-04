import 'dart:async';

import 'package:awr_vehicle_tracker/features/vehicle_list/data/model/vehicle.dart';
import 'package:awr_vehicle_tracker/features/vehicles_map_view/presentation/child/car_details_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VehicleMapGoogleMapView extends ConsumerStatefulWidget {
  const VehicleMapGoogleMapView({super.key, required this.vehicles});

  final List<Vehicle> vehicles;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VehicleMapGoogleMapViewState();
}

class _VehicleMapGoogleMapViewState
    extends ConsumerState<VehicleMapGoogleMapView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  List<Marker> markers = [];
  @override
  Widget build(BuildContext context) {
    final CameraPosition initialLocation = CameraPosition(
      target: LatLng(widget.vehicles.first.currentLocation.lat,
          widget.vehicles.first.currentLocation.lng),
      zoom: 10,
    );
    return GoogleMap(
      markers: markers.toSet(),
      mapType: MapType.normal,
      initialCameraPosition: initialLocation,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        addMarkers();
      },
    );
  }

  Future<void> addMarkers() async {
    BitmapDescriptor markerbitmap = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(48, 48)),
      'assets/car.png',
    );
    setState(() {
      markers.clear();
      for (var vehicle in widget.vehicles) {
        Marker marker = Marker(
          markerId: MarkerId((vehicle.vehiclePlate).toString()),
          position:
              LatLng(vehicle.currentLocation.lat, vehicle.currentLocation.lng),
          infoWindow: InfoWindow(
            title: vehicle.vehiclePlate,
            snippet: vehicle.description(),
          ),
          icon: markerbitmap,
          onTap: () {
            bottomSheetContent(vehicle);
          },
        );
        markers.add(marker);
      }
    });
  }

  void bottomSheetContent(Vehicle vehicle) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return CarDetailsContent(vehicle: vehicle);
      },
    );
  }
}
