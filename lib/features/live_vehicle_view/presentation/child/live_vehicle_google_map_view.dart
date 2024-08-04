import 'dart:async';

import 'package:awr_vehicle_tracker/features/live_vehicle_view/presentation/providers/directions_state_provider.dart';
import 'package:awr_vehicle_tracker/features/live_vehicle_view/presentation/providers/state/directions_state.dart';
import 'package:awr_vehicle_tracker/features/vehicle_list/data/model/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LiveVehicleGoogleMapView extends ConsumerStatefulWidget {
  const LiveVehicleGoogleMapView(this.vehicle, {super.key});

  final Vehicle vehicle;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LiveVehicleGoogleMapViewState();
}

class _LiveVehicleGoogleMapViewState
    extends ConsumerState<LiveVehicleGoogleMapView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    fetchDirections();
  }

  void fetchDirections() {
    List<LatLng> points = [];
    points.add(LatLng(widget.vehicle.start.lat, widget.vehicle.start.lng));
    points.add(LatLng(widget.vehicle.currentLocation.lat,
        widget.vehicle.currentLocation.lng));
    points.add(LatLng(widget.vehicle.end.lat, widget.vehicle.end.lng));
    final notifier = ref.read(directionsNotifierProvider.notifier);
    notifier.getDirections(points);
  }

  @override
  Widget build(BuildContext context) {
    final CameraPosition initialLocation = CameraPosition(
      target: LatLng(widget.vehicle.currentLocation.lat,
          widget.vehicle.currentLocation.lng),
      zoom: 14.4746,
    );

    final state = ref.watch(directionsNotifierProvider);
    List<Polyline> routePolylines = [];

    final List<LatLng> routePoints = state.directions
        .map((coordinate) => LatLng(coordinate.latitude, coordinate.longitude))
        .toList();

    // Create Polyline (requires Material UI for Color)
    routePolylines.add(Polyline(
      points: routePoints,
      color: Colors.blue,
      width: 4,
      polylineId: PolylineId(widget.vehicle.vehiclePlate),
    ));

    ref.listen(
      directionsNotifierProvider.select((value) => value),
      ((DirectionsState? previous, DirectionsState next) {
        if (next.state == DirectionsConcreteState.failure) {
          if (next.directions.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Path not found")));
          }
        }
      }),
    );

    return GoogleMap(
      polylines: routePolylines.toSet(),
      markers: markers.toSet(),
      mapType: MapType.normal,
      initialCameraPosition: initialLocation,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        addMarker(
            LatLng(widget.vehicle.currentLocation.lat,
                widget.vehicle.currentLocation.lng),
            widget.vehicle.vehiclePlate,
            widget.vehicle.description());
      },
    );
  }

  Future<void> addMarker(
      LatLng mLatLng, String mTitle, String mDescription) async {
    BitmapDescriptor markerbitmap = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(48, 48)),
      'assets/car.png',
    );
    setState(() {
      Marker marker = Marker(
          markerId: MarkerId(("${mTitle}_${markers.length}").toString()),
          position: mLatLng,
          infoWindow: InfoWindow(
            title: mTitle,
            snippet: mDescription,
          ),
          icon: markerbitmap //BitmapDescriptor.defaultMarker,
          );
      markers.clear();
      markers.add(marker);
    });
  }
}
