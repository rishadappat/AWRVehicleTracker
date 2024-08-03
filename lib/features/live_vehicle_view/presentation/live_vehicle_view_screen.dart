import 'package:auto_route/auto_route.dart';
import 'package:awr_vehicle_tracker/custom_views/vehicle_plate.dart';
import 'package:awr_vehicle_tracker/extensions/view_extensions.dart';
import 'package:awr_vehicle_tracker/features/live_vehicle_view/presentation/child/profile_view.dart';
import 'package:awr_vehicle_tracker/features/live_vehicle_view/presentation/map/map_view.dart';
import 'package:awr_vehicle_tracker/features/vehicle_list/data/model/vehicle.dart';
import 'package:awr_vehicle_tracker/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class LiveVehicleViewScreen extends ConsumerStatefulWidget {
  static const String routeName = '/liveVehicleViewScreen';
  const LiveVehicleViewScreen(this.vehicles, {super.key});

  final List<Vehicle> vehicles;

  @override
  ConsumerState<LiveVehicleViewScreen> createState() => _LiveVehicleViewScreenState();
}

class _LiveVehicleViewScreenState extends ConsumerState<LiveVehicleViewScreen> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        title: const Text('Vehicle Locations', 
        style: TextStyle(color: AppColors.primary, 
        fontSize: 20,
        fontWeight: FontWeight.bold)),
      ),
        body: Stack(
          children: [
            VehicleMapView(vehicles: widget.vehicles),
          ],
        ),
    );
  }
}