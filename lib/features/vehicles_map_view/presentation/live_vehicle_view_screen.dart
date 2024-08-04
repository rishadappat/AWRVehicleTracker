import 'package:auto_route/auto_route.dart';
import 'package:awr_vehicle_tracker/features/vehicles_map_view/presentation/map/vehicle_map_google_map_view.dart';
import 'package:awr_vehicle_tracker/features/vehicle_list/presentation/providers/state/vehicle_list_state.dart';
import 'package:awr_vehicle_tracker/features/vehicle_list/presentation/providers/vehicle_list_state_provider.dart';
import 'package:awr_vehicle_tracker/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class LiveAllVehiclesViewScreen extends ConsumerStatefulWidget {
  static const String routeName = '/liveAllVehiclesViewScreen';
  const LiveAllVehiclesViewScreen({super.key});

  @override
  ConsumerState<LiveAllVehiclesViewScreen> createState() =>
      _LiveVehicleViewScreenState();
}

class _LiveVehicleViewScreenState
    extends ConsumerState<LiveAllVehiclesViewScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(vehicleListNotifierProvider);
    ref.listen(
      vehicleListNotifierProvider.select((value) => value),
      ((VehicleListState? previous, VehicleListState next) {
        print(next.message);
      }),
    );

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
      body: Stack(
        children: [
          VehicleMapGoogleMapView(vehicles: state.vehicleList),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchVehicles();
  }

  void fetchVehicles() {
    final notifier = ref.read(vehicleListNotifierProvider.notifier);
    notifier.fetchProducts('');
  }
}
