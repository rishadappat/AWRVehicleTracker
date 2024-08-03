import 'package:awr_vehicle_tracker/custom_views/vehicle_plate.dart';
import 'package:awr_vehicle_tracker/extensions/view_extensions.dart';
import 'package:awr_vehicle_tracker/features/live_vehicle_view/presentation/child/profile_view.dart';
import 'package:awr_vehicle_tracker/features/vehicle_list/data/model/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class VehicleMapView extends StatefulWidget {
  const VehicleMapView({super.key, required this.vehicles});

  final List<Vehicle> vehicles;

  @override
  State<VehicleMapView> createState() => _VehicleMapViewState();
}

class _VehicleMapViewState extends State<VehicleMapView> {
  @override
  Widget build(BuildContext context) {
    List<Marker> markers = [];
    for (var vehicle in widget.vehicles) {
      Marker marker = Marker(point: LatLng(vehicle.currentLocation.lat, vehicle.currentLocation.lng),
      width: 50,
      height: 50, 
      child: const Image(
        image: AssetImage('assets/car.png')));
      markers.add(marker);
    }
    LatLng center = markers.first.point;
    
    return FlutterMap(
                  options: MapOptions(
                    initialCenter: center
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(markers: markers)
                    ],
);
  }
void bottomSheetContent(Vehicle vehicle) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (BuildContext context) {
              // todo 3: add listener to dragController

              return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 500,
                    padding: const EdgeInsets.fromLTRB(12, 40, 12, 8),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      color: Colors.white.withAlpha(200),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           VehiclePlate(vehiclePlate: vehicle.vehiclePlate),
                           Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                            Text(vehicle.vehicleBrand,
                                style: vehicleBrandTextStyle),
                            Text(vehicle.vehicleModel,
                                style: secondaryVehicleBrandTextStyle)
                           ],)
                        ],
                       ),
                        const ProfileView()
                      ],),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Icon(
                        Icons.drag_handle_outlined,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
  }

}