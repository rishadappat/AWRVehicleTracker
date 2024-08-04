import 'package:auto_route/auto_route.dart';
import 'package:awr_vehicle_tracker/features/live_vehicle_view/presentation/child/live_vehicle_google_map_view.dart';
import 'package:awr_vehicle_tracker/features/vehicle_list/data/model/vehicle.dart';
import 'package:awr_vehicle_tracker/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class LiveVehicleView extends ConsumerStatefulWidget {
  static const String routeName = '/liveVehicleViewScreen';
  const LiveVehicleView({super.key, required this.vehicle});

  final Vehicle vehicle;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LiveVehicleViewState();
}

class _LiveVehicleViewState extends ConsumerState<LiveVehicleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: AppColors.white,
          backgroundColor: AppColors.white,
          title: const Text('Vehicle Locations',
              style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        body: LiveVehicleGoogleMapView(widget.vehicle));
  }
}
