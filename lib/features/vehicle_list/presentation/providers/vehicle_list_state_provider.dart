import 'package:awr_vehicle_tracker/features/vehicle_list/presentation/providers/state/vehicle_list_notifier.dart';
import 'package:awr_vehicle_tracker/features/vehicle_list/presentation/providers/state/vehicle_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final vehicleListNotifierProvider =
    StateNotifierProvider<VehicleListNotifier, VehicleListState>((ref) {
  return VehicleListNotifier()..fetchProducts();
});